class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /categories
  def index
    @categories = Category.all
  end


  # GET /categories/new
  def new
    if current_user.try(:admin?)
      @category = Category.new
    else
      redirect_to posts_path
    end
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    if current_user.try(:admin?)
    @category = Category.new(category_params)
      if @category.save
       redirect_to posts_path
      else
         render :new 
      end
    else
      redirect_to posts_path
    end
  end

  # PATCH/PUT /categories/1
  def update
      if @category.update(category_params)
        redirect_to posts_path
      else
        render :edit 
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
       redirect_to posts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
