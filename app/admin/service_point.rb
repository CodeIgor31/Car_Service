# frozen_string_literal: true

ActiveAdmin.register ServicePoint do
  permit_params :address, :phone_number
end
