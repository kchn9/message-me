class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created successfully. You may login now!"
      redirect_to login_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params = change_password_params
    if @user.authenticate(params[:old_password]) && @user.update({
      :password => params[:password],
      :password_confirmation => params[:password_confirmation]
    })
      flash[:success] = "Password changed successfully! Log in again."
      session[:user_id] = nil
      redirect_to root_path
    else
      flash[:error] = "Password change failed! Check your password."
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :terms)
  end

  def change_password_params
    params.require(:user).permit(:password, :password_confirmation, :old_password)
  end


end
