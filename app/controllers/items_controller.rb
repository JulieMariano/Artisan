class ItemsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @category = Category.find(params["category_id"])
  end

  def show
    @user = User.find(current_user.id) if user_signed_in?
    @category = Category.find(params[:category_id])
    @item = Item.find(params[:id])
    @review = Review.new
    @order = Order.new
  end
end
