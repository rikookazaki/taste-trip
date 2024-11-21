class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @restaurant
    else
      render 'restaurants/show'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.find(params[:id])
    if @review.user == current_user || current_user.admin? # 自分のレビューか管理者のみ削除可能
      @review.destroy
      redirect_to @restaurant, notice: "レビューを削除しました。"
    else
      redirect_to @restaurant, alert: "レビューを削除する権限がありません。"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
