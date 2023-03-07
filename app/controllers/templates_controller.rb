class TemplatesController < ApplicationController

  def index
    @templates = Template.all
    @user = current_user
  end

  def show
    @template = Template.find(params[:id])
  end

end
