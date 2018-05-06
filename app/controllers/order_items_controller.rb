class OrderItemsController < ApplicationController
  def create
    @order = current_order
      if verify_item
        @order_item = @order.order_items.new(order_item_params)
        if @order.save
          session[:order_id] = @order.id
        end
      end
    redirect_to :back
  end

  def verify_item
    @order = current_order
    @order.order_items.each do |item|
      if item.product_id.to_i == params[:order_item][:product_id].to_i
        return false
      end
    end
    return true
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @product = Product.find((@order_item.product_id).to_i)
    if @order_item.quantity <= @product.stock
      if @order_item.update_attributes(order_item_params)
        puts "a"        
      else
        format.json { render json: @order_item.errors.full_messages, status: :unprocessable_enity }
      end
    else
      format.json { render json: "Não temos tantos produtos assim no estoque", status: :unprocessable_enity }
    end
    redirect_to cart_path
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
    params.require(:order_item).permit(:quantity, :product_id)
  end

end
