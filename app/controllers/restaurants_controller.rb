class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    # @restaurants = current_user.restaurants
    @restaurants = policy_scope(Restaurant)
  end

  def show
    authorize @restaurant
  end

  def new
    @restaurant = current_user.restaurants.build
    authorize @restaurant
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      redirect_to user_restaurants_path, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
    authorize @restaurant
  end

  def edit
    authorize @restaurant
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to user_restaurant_path(@restaurant)
    else
      render 'edit'
    end
    authorize @restaurant
  end

  def destroy
    @restaurant = current_user.restaurants.find(params[:id])
    @restaurant.destroy
    redirect_to user_restaurants_path, notice: 'Restaurant was successfully deleted.'
    authorize @restaurant
  end

  private

  def set_restaurant
    @restaurant = current_user.restaurants.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :address, :phone_number, :website, :email)
  end
end
