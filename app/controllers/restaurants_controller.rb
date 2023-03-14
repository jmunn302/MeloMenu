class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    # @restaurants = current_user.restaurants
    @restaurants = policy_scope(Restaurant)
    @menus = Menu.all
    @user = User.find(params[:user_id])
  end

  def show
    authorize @restaurant
    @restaurant = Restaurant.find(params[:id])
    @user = User.find(params[:user_id])
    @restaurants = Restaurant.all
    @menus = Menu.all
    @images = ["https://res.cloudinary.com/dobohmdlf/image/upload/v1678647629/6574597-02_k56olg.png", "https://res.cloudinary.com/dobohmdlf/image/upload/v1678647628/6574597-01_gy5egh.png", "https://res.cloudinary.com/dobohmdlf/image/upload/v1678647628/6574597-03_pdijez.png", "https://res.cloudinary.com/dobohmdlf/image/upload/v1678734089/6574597-05_s7ozav.png", "https://res.cloudinary.com/dobohmdlf/image/upload/v1678734088/6574597-04_r6olc6.png" ]
  end

  def new

    @restaurant = current_user.restaurants.build
    authorize @restaurant
  end

  def create

    @restaurant = current_user.restaurants.build(restaurant_params)
    @user = current_user
    @menu = Menu.new()
    if @restaurant.save
      redirect_to new_user_restaurant_menu_path(@user, @restaurant, @menu), notice: 'Restaurant was successfully created.'
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
