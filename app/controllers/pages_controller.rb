class PagesController < ApplicationController
  before_action :autorize, only: :create_sign

  def about
  end

  def services
    @services = Service.order(:title)
  end

  def gallery
  end

  def contacts
  end

  def sign
  end

  def create_sign
    @record = ServiceRecord.new(sign_form_params)
    @record.user_id = current_user.id
    if @record.valid?
      @record.save
      flash[:notice] = "Ваша заявка оставленна"
    else
      flash[:notice] = "Ваша заявка отклонена"
      redirect_to zap_path
    end
  end

  private
  def sign_form_params
    params.permit(:date, :trouble)
  end
end
