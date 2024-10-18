class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
    @countries = Country.all
    @genres = Genre.all
    @situations = Situation.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to root_path
    else 
      render :new, status: :unprocessable_entitiy
    end
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :access, :phone_num, :description, :opening_hours, :website, :payment, :country_ids, :genre_ids, :situation_ids, images:[] )
  end
end
