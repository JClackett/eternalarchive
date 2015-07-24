class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index]
    before_action :parents

  # GET /posts
  def index

    if params[:name].present?
      @posts = Post.joins(:categories).where(categories: { name: params[:name] } ).reverse
    else
      @posts = Post.all.reverse
    end

  end

  def parents
    @healthy = 'fitness', 'nutrition'
    @wealthy = 'investing', 'business'
    @wise = 'science', 'philosophy', 'politics', 'culture', 'sociology'
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:source, :url, :description,  category_ids: [] )
    end
end
