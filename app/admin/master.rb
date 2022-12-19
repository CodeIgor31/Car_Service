# frozen_string_literal: true

ActiveAdmin.register Master do
  permit_params :fio, :age, :stage
end
