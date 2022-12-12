ActiveAdmin.register User do
  permit_params :email, :login, :phone, :admin
end
