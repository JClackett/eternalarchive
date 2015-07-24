class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :parents

  def parents
    @category_healthy = Category.where(categories: { parent: "healthy" } )
    @category_wealthy = Category.where(categories: { parent: "wealthy" } )
    @category_wise = Category.where(categories: { parent: "wise" } )
  end

end
