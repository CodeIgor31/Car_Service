class CreateServicePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :service_points do |t|
      t.string :address
      t.string :phone_number
    end
  end
end
