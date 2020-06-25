class OrdersController < ApplicationController
  def create
    @review = Review.new
    @order = Order.new
    @item = Item.find(params[:item_id])
    @category = Category.find(params[:category_id])
    @order.item = @item
    @order.user = current_user

    if @order.save
      redirect_to category_item_path(@category, @item)
    else
      render 'items/show'
    end
  end

  def index
    @user = current_user
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_path
  end
end
