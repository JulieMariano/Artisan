class Admin::ItemsController < ApplicationController
  before_action :set_category, only: [:create, :update, :destroy]

  def create
    @item = Item.create(item_params)

    if @item.save
      redirect_to admin_category_items_path
    else
      render :new
    end
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)

    redirect_to admin_category_items_path(@category)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to admin_category_items_path(@category)
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :picture, :category_id)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
end
