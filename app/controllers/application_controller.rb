class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :parents

  before_action :configure_devise_permitted_parameters, if: :devise_controller?


  def parents
    @category_healthy = Category.where(categories: { parent: "healthy" } )
    if @category_healthy.present?
	    @category_healthy_name = []
	    @category_healthy.each do |category|
	      @category_healthy_name.push(category.name)
	  	end
	else
	  @category_healthy_name = "none"
    end

    @category_wealthy = Category.where(categories: { parent: "wealthy" } )
    
    if @category_wealthy.present?
	    @category_wealthy_name = []
	    @category_wealthy.each do |category|
	      @category_wealthy_name.push(category.name)
	    end
	else
		@category_wealthy_name = "none"
	end

    @category_wise = Category.where(categories: { parent: "wise" } )
    
    if @category_wise.present?
    	@category_wise_name = []
    	@category_wise.each do |category|
      		@category_wise_name.push(category.name)
    	end
    else
    	@category_wise_name = "none"
  	end
  end

   protected

  def configure_devise_permitted_parameters
    registration_params = [:username, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end

end
