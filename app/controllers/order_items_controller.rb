class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    if @order.save  
      session[:order_id] = @order.id
      # format.json { render json: @order, status: :created }
    else
      format.json { render json: @order.errors.full_messages, status: :unprocessable_enity }
    end
    redirect_back(fallback_location: 'back')
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    if @order_item.update_attributes(order_item_params)
       @order_items = @order.order_items
    else
      format.json { render json: @order_item.errors.full_messages, status: :unprocessable_enity }
    end
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    if @order_item.destroy
       @order_items = @order.order_items
    else 
       format.json { render json: @order_item.errors.full_messages, status: :unprocessable_enity }
    end
  end

  private
  def order_item_params
    params.permit(:quantity, :product_id)
  end

end