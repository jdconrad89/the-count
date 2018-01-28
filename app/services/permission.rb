class Permission

  extend Forwardable

  def_delegators :user

  def initialize(user, controller, action)
    @user       = user || User.new
    @controller = controller
    @action     = action
  end

  def authorized?
    case
    when @user.role == "0"  then permitted_for_registered?
      else permitted_for_guest?
    end
  end

  private

  attr_reader :controller, :action

  def permitted_for_registered?
    true
  end

  def permitted_for_guest?
    return true if sessions_controller_has_actions_new_create?
    return true if user_controller_and_has_action_new_create?
    return true if home_controller_and_has_action_index?
  end

  def sessions_controller_has_actions_new_create?
    controller == 'sessions' && action.in?(%w(new create))
  end

  def user_controller_and_has_action_new_create?
    controller == 'users' && action.in?(%w(new create))
  end

  def home_controller_and_has_action_index?
    controller == 'home' && action.in?(%w(index))
  end
end
