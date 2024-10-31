class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    current_user.favorites.create(restaurant: @restaurant)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @favorite = current_user.favorites.find_by(restaurant_id: params[:restaurant_id])
    @favorite.destroy if @favorite
    redirect_to restaurant_path(params[:restaurant_id])
  end

end
