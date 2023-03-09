class DishesController < ApplicationController

  before_action :set_dish, only: %i[ show edit update destroy]

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
    5.times { @menu.dishes.build }
    @dietary_types = ['Vegan', "Vegetarian", "Gluten-free", "Lactose-free"]
    authorize @dish
    @dishes = policy_scope(Dish)
  end

  def edit
    authorize @dish
  end

  def create
    @dish = Dish.new(dish_params)
    @dish.menu = Menu.find(params[:menu_id])
    @user = User.find(params[:user_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @dish.save
      raise
      redirect_to edit_user_restaurant_menu_path(@dish.menu, @restaurant, @user), notice: "Menu was successfully created."
    else
      render :new, status: :unprocessable_entity
      raise
    end
    authorize @dish
  end

  def update
    @dish.update(dish_params)
    redirect_to edit_user_restaurant_menu_path(@dish.menu, @restaurant, @user), notice: "Menu was successfully created."
    authorize @dish
  end

  def destroy
    @dish.destroy
    redirect_to menu_path(@dish.menu), status: :see_other
    authorize @dish
  end

  private

    def set_dish
      @dish = Dish.find(params[:id])
    end



  def dish_params
    params.require(:dish).permit(:name, :description, :price, :category, dietary_type: [])
  end

end
