# frozen_string_literal: true

# to see your services and theirs status
class MyServicesController < ApplicationController
  before_action :autorize, only: :show
  def show
    @my_services = ServiceRecord.where(user_id: current_user)
  end
end
