class UsersController < ApplicationController
#	before_action :authenticate_user!
#	after_action :verify_authorized

	def index
		@users = User.all
#		authorize User
	end

	def show
		@user = User.find(params[:id])
#		authorize @user
	end
	
	def create
		user = User.new(user_params)
		if user.save 
			session[:user_id] = user.id
			redirect_to '/songs'
		else
			flash[:registration_errors] = user.errors.full_messages
			redirect_to "/"
		end
			
	end
	
	def update
		@user = User.find(params[:id])
#		authorize @user
		if @user.update_attributes(user_params)
			redirect_to users_path, :notice => "User updated."
		else
			redirect_to users_path, :alert => "Unable to update user."
		end
	end

	def destroy
		user = User.find(params[:id])
		authorize user
		user.destroy
		redirect_to users_path, :notice => "User deleted."
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end

end
