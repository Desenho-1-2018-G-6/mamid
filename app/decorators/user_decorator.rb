class UserDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def full_name
    "#{first_name} #{last_name}"
  end

  def show_sidebar
    if current_user.user_type.include? "admin"
      render :partial => "users/admin_sidebar"
    end
  end

  def new_product
    if current_user.user_type.include? "admin"
      render 'form', product: Product.new
    end
  end

end
