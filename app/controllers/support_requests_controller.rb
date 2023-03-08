class SupportRequestsController < ApplicationController

  def index
    @support_requests = policy_scope(SupportRequest)
  end

  def new
    @support_request = SupportRequest.new
    authorize @support_request
  end

  def create
    @support_request = SupportRequest.new(support_request_params)

    if @support_request.save
      redirect_to user_restaurants_path, notice: "Your issue will be solved soon."
    else
      render :new
    end
  end

  private

  def support_request_params
    params.require(:support_request).permit(:name, :issue)
  end
end
