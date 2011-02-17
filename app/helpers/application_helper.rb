module ApplicationHelper
  
  def current_user_is_admin?
    return User.find(current_user).admin? if user_signed_in?
    false
  end
end
