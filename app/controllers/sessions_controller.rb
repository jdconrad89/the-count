class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if with_facebook?
      #byebug
      @user = User.new.find_or_create_by_omniauth(oauth_user_data)
      successful_login
    elsif !with_facebook?
      manual_login
    else
      unsuccessful_login
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def oauth_data
    request.env["omniauth.auth"]
  end

  def oauth_user_data
    {uid: oauth_data[:uid], info: oauth_data[:info], token: oauth_data["credentials"]["token"]}
  end

  def with_facebook?
    !oauth_data.nil?
  end

  def authenticated_user?(user)
    return false if user.nil?
    user = user.authenticate(user_params[:password])
  end

  def successful_login
    session[:user_id] = @user.id
    redirect_to profile_path, success: "You are successfully logged in, welcome back to The Count!"
  end

  def unsuccessful_login
    redirect_to new_session_path, danger: "Login failed, please try again."
  end

  def manual_login
    user = User.find_by(email: user_params[:email])
    if authenticated_user?(user)
      @user = user
      successful_login
    else
      unsuccessful_login
    end
  end
end
