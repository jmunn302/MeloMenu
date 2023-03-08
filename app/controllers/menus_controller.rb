class MenusController < ApplicationController

  before_action :set_menu, only: %i[show edit update destroy]

  def index
    @menus = Menu.all
    @restaurants = current_user.restaurants
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menus = policy_scope(Menu)
    @user = current_user
  end

  def show
    authorize @menu
  end

  def new
    @menu = Menu.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @user = current_user
    @templates = Template.all
    authorize @menu
  end

  def edit
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    authorize @menu
  end

  def create
    @menu = Menu.new(menu_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu.restaurant = @restaurant
    @menu.template = Template.find(params[:template_id])
    @templates = Template.all
    @user = current_user
    @dish = Dish.new
    if @menu.save
      redirect_to user_restaurant_menu_dishes_path(@user, @restaurant, @menu)
      # raise
    else
      render :new, status: :unprocessable_entity
    end
    authorize @menu
  end

  def update
    @menu.update(menu_params)
    redirect_to restaurant_path(@menu)
    authorize @menu
  end

  def destroy
    @menu.destroy
    redirect_to restaurant_path(@menu.restaurant), status: :see_other
    authorize @menu
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:menu_name, :id)
  end

end
