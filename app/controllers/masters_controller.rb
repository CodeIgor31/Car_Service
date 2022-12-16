# frozen_string_literal: true

# to see all masters
class MastersController < ApplicationController
  def show
    @masters = Master.order(:fio)
  end
end
