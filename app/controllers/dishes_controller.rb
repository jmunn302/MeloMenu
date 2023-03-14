class DishesController < ApplicationController

  before_action :set_dish, only: %i[show edit update destroy]

  def index
    @dishes = Dish.all
    @menu = Menu.find(params[:menu_id])
    @dish = Dish.new
    5.times { @menu.dishes.build }
    @dietary_types = ['Vegan', "Vegetarian", "Gluten-free", "Lactose-free"]
    authorize @dish
    @dishes = policy_scope(Dish)
  end

  def show
    authorize @dish
  end

  def new
    @menu = Menu.find(params[:menu_id])
    @dish = Dish.new
    @user = User.find(params[:user_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    5.times { @menu.dishes.build }
    # @dietary_types = ['Vegan', "Vegetarian", "Gluten-free", "Lactose-free"]
    authorize @dish
    @dishes = policy_scope(Dish)
    authorize @menu
    @user = current_user
    @restaurant = @menu.restaurant
    @dishes = Dish.all
    @starters = Dish.where("category = 'Starter'")
    @dinners = Dish.where("category = 'Dinner'")
    @lunches = Dish.where("category = 'Lunch'")
    @desserts = Dish.where("category = 'Dessert'")
    @sides = Dish.where("category = 'side'")
    @breakfasts = Dish.where("category = 'Breakfast'")
  end

  def edit
    authorize @dish
  end

  def create
    @dish = Dish.new(dish_params)
    @user = User.find(params[:user_id])
    @menu = Menu.find(params[:menu_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish.menu = @menu
    if @dish.save
      redirect_to new_user_restaurant_menu_dish_path(@user, @restaurant, @menu), notice: "Created!"
    else
      render :new, status: :unprocessable_entity
    end
    authorize @dish
  end

  def update
    @dish.update(dish_params)
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:menu_id])
    redirect_to edit_user_restaurant_menu_path(@user, @restaurant, @menu), notice: "Successfully updated"
    authorize @dish
  end

  def destroy
    @dish.destroy
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:menu_id])
    redirect_to edit_user_restaurant_menu_path(@user, @restaurant, @menu), notice: "Successfully deleted"
    authorize @dish
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:category, :name, :description, :dietary_type, :price)
  end

end
