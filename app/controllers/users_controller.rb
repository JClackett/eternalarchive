class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])

	    @posts = Post.joins(:users).where(users: { user_id: params[@user] } ).uniq.paginate(:page => params[:page], :per_page => 10).reverse_order
	    
	end
end
