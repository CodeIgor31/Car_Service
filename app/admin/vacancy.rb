# frozen_string_literal: true

ActiveAdmin.register Vacancy do
  permit_params :title
end
