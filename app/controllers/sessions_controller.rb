class SessionsController < ApplicationController
  before_action :require_not_logged_in, only: [:new, :create]

  def new
  end

  def create
    credentials = login_params
    user = User.find_by(username: credentials[:username])
    if user && user.authenticate(credentials[:password])
      cookies[:username] = user.username
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
    cookies[:username] = 'guest'
    session[:user_id] = nil
    redirect_to root_path, status: :see_other
  end

  private
  def login_params
    params.require(:session).permit(:username, :password)
  end

  def require_not_logged_in
    if logged_in?
      redirect_to root_path
    end
  end

end
