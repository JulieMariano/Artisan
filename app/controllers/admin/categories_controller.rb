class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:update, :show, :destroy]

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    @category.save
  end

  def update
    @category.update(category_params)
  end

  def show
    @items = Item.where(category: @category)
  end

  def destroy
    @category.destroy
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
