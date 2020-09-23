class PaymentsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @order_items = @order.orders_items
  end
end
