class ItemsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @category = Category.find(params["category_id"])
    @category_items = @category.items_by_relevance
  end

  def show
    @user = User.find(current_user.id) if user_signed_in?
    @category = Category.find(params[:category_id])
    @item = Item.find(params[:id])
    @review = Review.new
  end
end
