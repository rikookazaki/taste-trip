class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant

  def create
    current_user.favorites.create(restaurant: @restaurant)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @restaurant }
    end

  end

  def destroy
    favorite = Favorite.find_by(restaurant: @restaurant, user: current_user)
    favorite.destroy 
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @restaurant }
    end
  end


  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
