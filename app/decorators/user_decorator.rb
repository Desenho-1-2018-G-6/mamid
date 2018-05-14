class UserDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def full_name
    "#{first_name} #{last_name}"
  end

  def show_admin_options
    if current_user.user_type.include? "admin" or current_user.user_type.include? "manager"
      render :partial => "users/sidebar"
    end
  end

  def show_edit_buttons
    if current_user.user_type.include? "admin"
      return true
    else
      return false
    end
  end

end