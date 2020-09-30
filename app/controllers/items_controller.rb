class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @category = Category.find(params[:category_id])
    @category_items = @category.items_by_relevance
  end

  def show
    @category = Category.find(params[:category_id])
    @item = Item.find(params[:id])
    @review = Review.new
  end
end
