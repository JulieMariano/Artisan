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

    # Get the reviews size and rating average variables
    # Prepare this variables to be directly displayed on the view
    @reviews_size = @item.reviews.size
    @rating_average = @item.rating_average.round(1)

    if @reviews_size.zero?
      @rating_average = "Not rated"
      @reviews_size = ""
    else
      @reviews_size = (@reviews_size == 1 ? "1 rating" : "#{@reviews_size} ratings")
    end
  end
end
