class PagesController < ApplicationController
  def about
  end

  def services
    @services = Service.order(:title)
  end

  def gallery
  end

  def contacts
  end

  def busket
  end
end
