class MyServicesController < ApplicationController
  before_action :autorize, only: :show
  def show
    @my_services = ServiceRecord.where(user_id: current_user)
  end
end
