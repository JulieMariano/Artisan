class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    if current_user.nil?
      redirect_to new_user_session_path
      flash[:alert] = 'You need to sign in or sign up before continuing'

    else
      @review = Review.new(review_params)
      @item = Item.find(params[:item_id])
      @review.item = @item
      @review.user = current_user

      @review.save
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
