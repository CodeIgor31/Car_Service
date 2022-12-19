# frozen_string_literal: true

class ConsultationMailer < ApplicationMailer
  def my_consult
    @user = params[:user]
    mail(to: @user.email, subject: 'Заявка на консультацию')
  end
end
