# frozen_string_literal: true

class SigningMailer < ApplicationMailer
  def my_record
    @user = params[:user]
    @record = params[:record]
    mail(to: @user.email, subject: 'Ваш заказ')
  end
end
