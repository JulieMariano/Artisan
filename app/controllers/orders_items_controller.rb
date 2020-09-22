class OrdersItemsController < ApplicationController
  def destroy
    @orders_item = OrdersItem.find(params[:id])
    @orders_item.destroy

    redirect_to orders_path
  end
end
