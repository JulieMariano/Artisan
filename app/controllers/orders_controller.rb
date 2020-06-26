class OrdersController < ApplicationController
  def create
    @review = Review.new
    @order = Order.new
    @item = Item.find(params[:item_id])
    @category = Category.find(params[:category_id])
    @order.item = @item
    @order.user = current_user

    if @order.save
      redirect_to category_item_path(@category, @item), notice: "🛒 #{@item.name} was added to your shopping cart!"
    else
      render 'items/show'
    end
  end

  def index
    @user = current_user
    @total = @user.pending_orders.map {|order| order.item.price}.sum
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_path
  end

  def buy_all
    current_user.pending_orders.update_all(bought: true)
    redirect_to orders_path
  end

  def buy_one
    Order.find(params["format"]).update(bought: true)
    redirect_to orders_path
  end
end
