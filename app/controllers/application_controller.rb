class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :parents

  def parents
    @category_healthy = Category.where(categories: { parent: "healthy" } )
    @category_healthy_name = []
    @category_healthy.each do |category|
      @category_healthy_name.push(category.name)
    end

    @category_wealthy = Category.where(categories: { parent: "wealthy" } )
    @category_wealthy_name = []
    @category_wealthy.each do |category|
      @category_wealthy_name.push(category.name)
    end

    @category_wise = Category.where(categories: { parent: "wise" } )
    @category_wise_name = []
    @category_wise.each do |category|
      @category_wise_name.push(category.name)
    end
  end

end
