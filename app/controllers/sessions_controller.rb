class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: login_params[:email])
		if user && user.authenticate(login_params[:password])
			session[:user_id] = user.id
			redirect_to "/songs"
		else
			flash[:login_error] = "Invalid please try again"
			redirect_to '/'
		end 
	end
	
	def destroy
		reset_session
		session[:user_id] = nil
		redirect_to '/'
	end
	
	private
	def login_params
			params.require(:login).permit(:email, :password)
	end
end
