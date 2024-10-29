class RestaurantsController < ApplicationController

  def index
    @q = Restaurant.ransack(params[:q])
    @restaurants = @q.result.includes(:countries, :genres, :situations)
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

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    @countries = Country.all 
    @genres = Genre.all 
    @situations = Situation.all 
  end

  def update
    @restaurant = Restaurant.find(params[:id])
  
    # 新しい画像がアップロードされていない場合、imagesパラメータを削除しない
    if params[:restaurant][:images].blank?
      params[:restaurant].delete(:images) # imagesを削除しても、既存の画像は保持される
    end
  
    if @restaurant.update(restaurant_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  
  

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :access, :phone_num, :description, :opening_hours, :website, :payment, country_ids:[], genre_ids:[], situation_ids:[], images:[] )
  end
end
