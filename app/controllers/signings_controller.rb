# frozen_string_literal: true

# to order service
class SigningsController < ApplicationController
  before_action :autorize, only: :create_sign

  def services
    @services = Service.order(:title)
  end

  def sign; end

  def create_sign
    @record = ServiceRecord.new(sign_form_params)
    @record.user_id = current_user.id
    if @record.valid?
      SigningMailer.with(record: @record, user: current_user).my_record.deliver_now
      @record.save
      flash[:notice] = 'Ваша заявка оставленна'
    end
  end

  private

  def sign_form_params
    params.permit(:service_id, :service_point_id, :date, :trouble, :master_id, pictures: [])
  end
end
