class Admin::ItemsController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @items = Item.where(category: @category)
  end

  def show
    @category = Category.find(params[:category_id])
    @item = Item.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @item = Item.new
    @admin = current_user
  end

  def create
    @category = Category.find(params[:category_id])
    @item = Item.create(item_params)
    if @item.save
      redirect_to admin_category_items_path
    else
      render :new
    end
  end


  def edit
    @category = Category.find(params[:category_id])
    @item = Item.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:category_id])
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_category_item_path(@category, @item)
  end

  def delete
    @category = Category.find(params[:category_id])
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :picture, :category_id )
  end


end
