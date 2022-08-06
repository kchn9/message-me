class SessionsController < ApplicationController
  def new
  end

  def create
    credentials = login_params
    user = User.find_by(username: credentials[:username])
    if user && user.authenticate(credentials[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def login_params
    params.require(:session).permit(:username, :password)
  end

end
