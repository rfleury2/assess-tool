class UsersController < ApplicationController
  # before_filter :redirect_signed_in_users, only: [:create, :new]
  # skip_before_filter :require_login, only: [:create, :new], raise: false
  # skip_before_filter :authorize, only: [:create, :new], raise: false

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # sign_in @user
      redirect_back_or root_path
    else
      render :new
    end
  end

  private

  # def redirect_signed_in_users
  #   if signed_in?
  #     redirect_to root_path
  #   end
  # end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
