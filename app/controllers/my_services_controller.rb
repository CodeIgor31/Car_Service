# frozen_string_literal: true

# to see your services and theirs status
class MyServicesController < ApplicationController
  before_action :autorize, only: :show
  def show
    @my_services = ServiceRecord.where(user_id: current_user)
  end

  def edit
    @service = ServiceRecord.find_by(id: params[:ord_id])
    session[:service_edit] = @service.id
  end

  def update
    @flag = false
    @service = ServiceRecord.find_by(id: session[:service_edit])
    if @service.update change_date_params
      @flag = true
      flash[:notice] = "Дата записи обновлена. Новая дата: #{l @service.date, format: :long}"
    end
  end

  private

  def change_date_params
    params.permit(:date)
  end

end
