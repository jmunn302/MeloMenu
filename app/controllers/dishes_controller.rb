class DishesController < ApplicationController

  before_action :set_dish, only: %i[ show edit update destroy]

  def index
    @dishes = Dish.all
  end

  def show
  end


  def new
    @dish = Dish.new
  end

  def edit
  end

  def create
    @dish = Dish.new(dish_params)

    if @dish.save
      redirect_to @dish.menu, notice: "Menu was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @dish.update(dish_params)
    redirect_to menu_path(@dish)
  end

  def destroy
    @dish.destroy
    redirect_to menu_path(@dish.menu), status: :see_other
  end

  private
    def set_dish
      @dish = Dish.find(params[:id])
    end

    def dish_params
      params.require(:dish).permit(:name, :description, :price, :dietary_type, :category)
    end

end
