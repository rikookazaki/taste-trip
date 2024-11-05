class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :get_3tables, only: [:new, :edit, :create, :update]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    if current_user&.admin?
      @restaurants = Restaurant.pending
    else
    @q = Restaurant.approved.ransack(params[:q])
    @restaurants = @q.result.includes(:countries, :genres, :situations)
    if params[:q].present?
      # 国名によるフィルタリング
      if params[:q][:countries_name_or_countries_region_cont].present?
        @restaurants = @restaurants.joins(:countries)
          .where(
            "countries.name = :country_name OR countries.region = :region_name",
            country_name: params[:q][:countries_name_or_countries_region_cont],
            region_name: params[:q][:countries_name_or_countries_region_cont]
          )
      end
      # ジャンルによるフィルタリング
      if params[:q][:genre_ids_in].present?
        @restaurants = @restaurants.joins(:genres)
          .where(genres: { id: params[:q][:genre_ids_in] })
          .distinct  # 重複を排除
      end
      # 利用シーンによるフィルタリング
      if params[:q][:situation_ids_in].present?
        @restaurants = @restaurants.joins(:situations)
          .where(situations: { id: params[:q][:situation_ids_in] })
          .distinct  # 重複を排除
      end
    end
    # 条件を満たす飲食店を表示
    @restaurants = @restaurants.distinct
    end
  end


  def new
    @restaurant = Restaurant.new
  end


  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to root_path
    else 
      render :new, status: :unprocessable_entity
    end
  end


  def show
  end


  def edit
  end


  def update
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
  

  def destroy
    @restaurant.destroy
    redirect_to root_path
  end
  
  

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :access, :phone_num, :description, :opening_hours, :website, :payment, country_ids:[], genre_ids:[], situation_ids:[], images:[] )
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def get_3tables
    @countries = Country.all
    @genres = Genre.all
    @situations = Situation.all
  end
end
