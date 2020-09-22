class OrdersItemsController < ApplicationController
  def update
    orders_item = OrdersItem.find(params[:id])
    orders_item.update(orders_item_params) if orders_item_params[:quantity].to_i.positive?
  end

  def destroy
    orders_item = OrdersItem.find(params[:id])
    orders_item.destroy

    @cart_items = current_user.pending_order.orders_items.order(created_at: :desc)
  end

  private

  def orders_item_params
    params.require(:orders_item).permit(:quantity)
  end
end
