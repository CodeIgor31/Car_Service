# frozen_string_literal: true

class WorkMailer < ApplicationMailer
  def my_application_for_work
    @user = params[:user]
    @work = params[:work]
    mail(to: @user.email, subject: 'Заявка о приеме на работу')
  end
end
