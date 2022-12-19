# frozen_string_literal: true

ActiveAdmin.register Work do
  permit_params :user_id, :age, :male, :about, :task_1, :task_2, :task_3
end
