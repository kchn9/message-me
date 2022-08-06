class SessionsController < ApplicationController
  def new
  end

  def create
    credentials = login_params
    user = User.find_by(username: credentials[:username])
    if user && user.authenticate(credentials[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.username}!"
      redirect_to root_path
    else
      flash.now[:error] = "Log in failed. Wrong credentials."
      render :new
    end
  end

  def destroy
    flash[:success] = "Logged out succefully. Take care #{current_user.username}!"
    session[:user_id] = nil
    redirect_to root_path, status: :see_other
  end

  private
  def login_params
    params.require(:session).permit(:username, :password)
  end

end
