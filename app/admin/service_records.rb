# frozen_string_literal: true

ActiveAdmin.register ServiceRecord do
  permit_params :trouble, :date, :user_id, :service_id, :status, :master_id
end
