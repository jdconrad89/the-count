module FeatureHelper

  def logged_in_user
    user = create(:user, name: 'Waylon Jennings', email:'waylon@music.com', password: 'password' )
    page.set_rack_session(user_id: user.id)
    user
  end

end
