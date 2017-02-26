module ApplicationHelper
  def logged_in?
    !current_user.nil?
  end

  def recipes?
    current_user.recipes.count == 0
  end
end
