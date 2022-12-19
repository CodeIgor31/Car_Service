# frozen_string_literal: true

# to get job
class WorksController < ApplicationController
  before_action :autorize
  include WorksHelper
  def main; end

  def prom; end

  def test_page
    @work = Work.new(about_form_params)
    @work.user_id = current_user.id
    @male = params[:male]
    @work.male = set_male(@male)
    if @work.valid?
      WorkMailer.with(user: current_user, work: @work).my_application_for_work.deliver_now
      @work.save
      flash[:notice] = 'Ваша заявка вскоре будет рассмотрена'
    end
  end

  private

  def about_form_params
    params.permit(:vacancy_id, :age, :about, :task_1, :task_2, :task_3)
  end
end
