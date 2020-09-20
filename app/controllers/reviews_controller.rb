class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @item = Item.find(params[:item_id])
    @review.item = @item
    @review.user = current_user

    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
