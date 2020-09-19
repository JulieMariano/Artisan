class ReviewsController < ApplicationController
  def create
    @order = Order.new
    @review = Review.new(review_params)
    @item = Item.find(params[:item_id])
    @user = User.find(current_user.id)
    @review.item = @item
    @review.user = @user

    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
