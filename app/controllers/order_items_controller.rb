class OrderItemsController < ApplicationController
  before_action :set_order_variables, only: [:update, :destroy]

  def update
    # Update it only if the quantity param is positive
    @order_item.update(order_item_params) if order_item_params[:quantity].to_i.positive?
  end

  def destroy
    @order_item.destroy
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity)
  end

  def set_order_variables
    @order = current_user.cart
    @order_items = @order.order_items.order(created_at: :desc)
    @order_item = @order_items.find(params[:id])
  end
end
