class ItemsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @category = Category.find(params["category_id"])
    @items = @category.items
  end

  def show
    @item = Item.find(params[:id])
  end
end
