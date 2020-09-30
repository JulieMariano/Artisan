class Admin::ItemsController < ApplicationController
  before_action :set_category, only: [:create, :update, :destroy]

  def create
    @item = Item.new(item_params)
    @item.category = @category
    @item.sku = generate_sku(@item.name)
    @item.save
  end

  def update
    update_params = item_params
    update_params["sku"] = generate_sku(item_params[:name])   # Add the sku column to the params

    @item = Item.find(params[:id])
    @item.update(update_params)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :picture)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  # Method that generates the Item sku based on its name
  def generate_sku(item_name)
    item_name.downcase.split(' ').join('_')
  end
end
