class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
  end

  def create
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update

    redirect_to admin_categories_path
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items
  end

  def destroy
  end
end
