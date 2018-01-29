class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_path, success: "You have successfully signed up! Welcome to The Count!"
    else
      redirect_to new_user_path, danger: "Failed to create an account, please try again."
    end
  end

  def show
    @user = found_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def found_user
    User.find(session[:user_id])
  end
end
