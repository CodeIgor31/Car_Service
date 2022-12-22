# frozen_string_literal: true

# to see your services and theirs status
class MyServicesController < ApplicationController
  before_action :check_user, only: :edit
  before_action :autorize, only: :show
  def show
    @my_services = ServiceRecord.where(user_id: current_user)
  end

  def edit
    session[:service_edit] = @service.id
  end

  def update
    @flag = false
    @service = ServiceRecord.find_by(id: session[:service_edit])
    return unless @service.update change_date_params

    @flag = true
    flash[:notice] = 'Дата записи обновлена'
  end

  private

  def check_user
    @service = ServiceRecord.find_by(id: params[:ord_id])
    redirect_to home_path if current_user.id != @service.user_id
  end

  def change_date_params
    params.permit(:date)
  end
end
