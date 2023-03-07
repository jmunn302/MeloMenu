class TemplatesController < ApplicationController

  def index
    @templates = Template.all
  end

  def show
    @templates = Template.find(params[:id])
  end

end
