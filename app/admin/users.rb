ActiveAdmin.register User do
  permit_params :email, :first_name, :second_name, :phone, :admin
end
