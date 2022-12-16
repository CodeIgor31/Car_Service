ActiveAdmin.register Consultation do
    permit_params :user_id, :mail, :phone
  end
  