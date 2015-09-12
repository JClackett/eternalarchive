class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :randomize]
    before_action :parents

    
  # GET /posts
  def index
    if params[:name].present?
      @posts = Post.joins(:categories).where(categories: { name: params[:name] } ).uniq.paginate(:page => params[:page], :per_page => 10).reverse_order
      @category_title =  params[:name]
        if @category_title.kind_of?(Array)
          if @category_title.include?("Fitness")
            @category_title = "Healthy"
          elsif @category_title.include?("Business")
            @category_title = "Wealthy"
          else @category_title.include?("Culture")
            @category_title = "Wise"
          end
        end
    else
      @posts = Post.paginate(:page => params[:page], :per_page =>10).reverse_order
      @category_title =  "Self Educate"
    end
  end

  def profile
    @posts =  Post.joins(:bookmarks).where(bookmarks: { user_id: current_user} ).uniq.paginate(:page => params[:page], :per_page => 10).reverse_order
    @category_title =  current_user.username
  end


  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    if current_user.try(:admin?)
      @post = Post.new
    else
      redirect_to posts_path
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
      if @post.save
        redirect_to posts_path
      else
        render :new 
      end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
      if @post.update(post_params)
        redirect_to posts_path
      else
         render :edit 
      end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def upvote
    @post = Post.find(params[:id])
    if current_user.voted_up_on? @post
      @post.downvote_by current_user
    else
      @post.upvote_by current_user
    end
    puts @post.id
    respond_to do |format|
        format.js
    end

    
  end

    # POST /posts/:id/upvote
  def bookmark
    @post = Post.find(params[:id])
    @bookmark = @post.bookmarks.new(user: current_user)
    if @bookmark.save
    else
      @bookmark = Bookmark.where(params[:user_id => current_user.id, :post_id => @post.id])
      @bookmark.first.destroy
    end
    redirect_to :back
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:source, :url, :description, :article_url, :user_id, :username, category_ids: [] )
    end
end
