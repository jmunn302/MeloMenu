class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = current_user.restaurants
  end

  def show
  end

  def new
    @restaurant = current_user.restaurants.build
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      redirect_to user_restaurants_path, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @restaurant = current_user.restaurants.find(params[:id])
    @restaurant.destroy
    redirect_to user_restaurants_path, notice: 'Restaurant was successfully deleted.'
  end

  private

  def set_restaurant
    @restaurant = current_user.restaurants.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :type, :phone_number, :website, :email)
  end
end
