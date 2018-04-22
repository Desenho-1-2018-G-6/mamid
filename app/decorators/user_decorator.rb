class UserDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def full_name
    "#{first_name} #{last_name}"
  end

  def show_sidebar
    if current_user.user_type == "admin"
    render :partial => "users/admin_sidebar"
    end
  end

end