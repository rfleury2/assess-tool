class UsersController < ApplicationController
  def new
    flash.clear
    @user = User.new
  end

  def create
    @user = SignUp.new(user_params).user
    if @user.save
      assign_cookie
      redirect_to dashboard_path
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def assign_cookie
    cookies[:auth_token] = @user.auth_token
  end

  # def redirect_signed_in_users
  #   if signed_in?
  #     redirect_to root_path
  #   end
  # end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
