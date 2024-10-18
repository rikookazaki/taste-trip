class RestaurantsController < ApplicationController

  def index
    
  end

  def new
    @restaurant = Restaurant.new
    @countries = Country.all
    @genres = Genre.all
    @situations = Situation.all
  end
end
