class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show, :mostliked, :mostrecent, :upvote, :shuffle]

    
  # GET /posts
  def index
     if params[:name].present?
        if params[:name] == "all" 
          @posts = Post.uniq.paginate(:page => params[:page], :per_page =>10).reverse_order
          @title =  "All Content"
        else
         @posts = Post.joins(:categories).where(categories: { name: params[:name] } ).uniq.paginate(:page => params[:page], :per_page => 10).reverse_order
         @title =  params[:name].titleize
       end
    else
      @posts = Post.uniq.paginate(:page => params[:page], :per_page =>10).reverse_order
      @title =  "Welcome to The Eternal Archive"
      @slogan =  "A collection of all the best videos and content from across the internet"
    end   
  end

  def profile
    @bookmarked_posts =  Post.joins(:bookmarks).where(bookmarks: { user_id: current_user} ).uniq.paginate(:page => params[:page], :per_page => 10).reverse_order   
    @title =  current_user.username.titleize
  end


  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    if current_user.try(:admin?)
      @post = Post.new
    else
      redirect_to root_path
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
      if @post.save
        redirect_to root_path 
      else
        render :new 
      end

  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
      if @post.update(post_params)
        redirect_to root_path
      else
         render :edit 
      end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to root_path
  end

      # POST /posts/:id/like

  def upvote
    if user_signed_in?

      @post = Post.find(params[:id])
      if current_user.voted_up_on? @post
        @post.downvote_by current_user
      else
        @post.upvote_by current_user
      end

    else
      respond_to do |format|
          format.js
          format.html { redirect_to(new_user_registration) }
      end

    end
  end

  def shuffle
      @post=Post.all.shuffle.first
      render :show
  end

  def bookmark
    @post = Post.find(params[:id])
    if Bookmark.where(user_id: current_user.id, post_id: @post.id).present?
      @bookmark = Bookmark.where(user_id: current_user.id, post_id: @post.id)
      @bookmark.first.delete
            respond_to do |format|
        format.js
      end
    else
      @bookmark = @post.bookmarks.new(user: current_user)
      @bookmark.save
      respond_to do |format|
        format.js
      end
    end 
  end

  def mostliked 
    @title = "Most liked of the Week"
    @posts = Post.uniq.where('created_at >= ?', 7.days.ago).order(:cached_votes_total => :desc).paginate(:page => params[:page], :per_page => 11)
  end

  def mostrecent
      @title = "Latest Content"
      @posts = Post.uniq.limit(11).reverse_order
  end


  private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit( :url, :description,:keywords, :image_url, :user_id, :username, category_ids: [] )
    end
end
