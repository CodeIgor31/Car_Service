# frozen_string_literal: true

# to get a consultation
class ConsultationsController < ApplicationController
  before_action :autorize
  include ConsultationsHelper
  def index; end

  def consult_response
    @consultation = Consultation.new(cons_form_params)
    @consultation.user_id = current_user.id
    @consultation.way = set_ways(params[:way])
    @consultation.phone, @consultation.mail = set_info
    if @consultation.valid?
      ConsultationMailer.with(user: current_user).my_consult.deliver_now
      @consultation.save
      flash[:notice] = 'Ваша заявка на консультацию оставленна, с вами свяжутся в течение часа'
    end
  end

  private

  def cons_form_params
    params.permit(:body)
  end
end
