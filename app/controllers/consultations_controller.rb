class ConsultationsController < ApplicationController
  before_action :autorize, only: :consult_response
  def index
  end

  def consult_response
    @consultation = Consultation.new(cons_form_params)
    @consultation.user_id = current_user.id
    @way = params[:way]
    case @way
    when 'phone'
      @consultation.phone = current_user.phone
    when 'mail'
      @consultation.mail = current_user.email
    when 'any'
      @consultation.phone = current_user.phone
      @consultation.mail = current_user.email
    end
    if @consultation.valid?
      @consultation.save
      flash[:notice] = "Ваша заявка на консультацию оставленна, с вами свяжутся в течение часа"
    else
      flash[:notice] = 'Что-то пошло не так'
    end
  end

  private
  def cons_form_params
    params.permit(:body)
  end

end
