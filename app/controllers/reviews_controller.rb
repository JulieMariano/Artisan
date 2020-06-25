class ReviewsController < ApplicationController
  def create
    @order = Order.new
    @review = Review.new(review_params)
    @item = Item.find(params[:item_id])
    @user = User.find(current_user.id)
    @category = Category.find(params[:category_id])
    @review.item = @item
    @review.user = @user

    if @review.save
      redirect_to category_item_path(@category, @item)
    else
      render 'items/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
