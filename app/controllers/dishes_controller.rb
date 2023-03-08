class DishesController < ApplicationController

  before_action :set_dish, only: %i[ show edit update destroy]

  def index
    @dishes = Dish.all
    @menu = Menu.find(params[:menu_id])
    @dish = Dish.new
    @dietary_types = ['Vegan', "Vegetarian", "Gluten-free", "Lactose-free"]
    authorize @dish
    @dishes = policy_scope(Dish)
  end

  def show
    authorize @dish
  end


  def new
    @dish = Dish.new
    authorize @dish
  end

  def edit
    authorize @dish
  end

  def create
    @dish = Dish.new(dish_params)
    @dish.menu = Menu.find(params[:menu_id])
    if @dish.save
      redirect_to user_restaurant_menus_path, notice: "Menu was successfully created."
    else
      render :new, status: :unprocessable_entity
      raise
    end
    authorize @dish
  end

  def update
    @dish.update(dish_params)
    redirect_to menu_path(@dish)
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
    params.require(:dish).permit(:name, :description, :price, :category, :dietary_type)
  end

end
