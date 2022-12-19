# frozen_string_literal: true

ActiveAdmin.register Service do
  permit_params :title, :description, :price, :image
end
