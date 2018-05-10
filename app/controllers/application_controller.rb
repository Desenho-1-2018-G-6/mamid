class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  add_flash_types :success, :warning, :danger, :info

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      @in_progress = InProgressState.new
      @order_status = OrderStatus.create(state: @in_progress.status)
      Order.new(order_status_id: @order_status.id)
    end
  end


  helper CSSModules::ViewHelper

  include SessionsHelper
end
