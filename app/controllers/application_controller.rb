class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  add_flash_types :success, :warning, :danger, :info
  before_action :verify_state

  def current_order
    unless session[:order_id].nil?
      Order.find(session[:order_id])
    else
      @order_status = OrderStatus.create
      Order.new(order_status_id: @order_status.id)
    end
  end

  def verify_state
    unless session[:order_id].nil?
      if current_order.order_items.empty?
        @state = EmptyState.new.status
      else
        @status = InProgressState.new.status
      end
    else
      @state = EmptyState.new.status
    end
  end

  helper CSSModules::ViewHelper

  include SessionsHelper
end
