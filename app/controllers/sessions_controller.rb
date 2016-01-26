class SessionsController < ApplicationController
  before_filter :require_login, only: [:destroy]

  ERROR_MESSAGE = "Your email or password is incorrect."

  def new
    flash.clear
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if can_authenticate?
      assign_cookie
      redirect_to dashboard_path
    else
      flash[:errors] = [ERROR_MESSAGE]
      render :new
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_path
  end

  private 

  def assign_cookie
    cookies[:auth_token] = @user.auth_token
  end

  def can_authenticate?
    @user && @user.authenticate(params[:user][:password])
  end
end