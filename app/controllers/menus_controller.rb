class MenusController < ApplicationController

    before_action :set_menu, only: %i[ show edit update destroy]

    def index
      @menus = Menu.all
    end

    def show
    end


    def new
      @menu = Menu.new
    end

    def edit
    end

    def create
      @menu = Menu.new(menu_params)

      if @menu.save
        redirect_to @menu, notice: "Menu was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      @menu.update(menu_params)
      redirect_to restaurant_path(@menu)
    end

    def destroy
      @menu.destroy
      redirect_to restaurant_path(@menu.restaurant), status: :see_other
    end

    private
      def set_menu
        @menu = Menu.find(params[:id])
      end

      def restaurant_params
        params.require(:menu).permit(:name)
      end

end
