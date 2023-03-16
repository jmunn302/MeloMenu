class SupportRequestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]


  def index
    @support_request = policy_scope(SupportRequest)

  end


end
