class OrderItemsController < ApplicationController
  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(order_item_params) if order_item_params[:quantity].to_i.positive?

    @order = current_user.cart
    @order_items = @order.order_items.order(created_at: :desc)
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    order_item.destroy

    @order = current_user.cart
    @order_items = @order.order_items.order(created_at: :desc)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity)
  end
end
