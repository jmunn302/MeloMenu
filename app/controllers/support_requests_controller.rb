class SupportRequestsController < ApplicationController

  def index
    @support_requests = policy_scope(SupportRequest)
  end

  def new
    @support_request = SupportRequest.new
    authorize @support_request
  end



  private

  def support_request_params
    params.require(:support_request).permit(:name, :issue)
  end
end
