ActiveAdmin.register ServiceRecord do
  permit_params :trouble, :date, :user_id, :service_id, :status
end
