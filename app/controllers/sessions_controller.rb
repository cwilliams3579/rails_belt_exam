class SessionsController < ApplicationController
  def index
    #code
  end
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:errors] = ["Invalid"]
      redirect_to new_session_path
    end
  end
  def destroy
    reset_session
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
