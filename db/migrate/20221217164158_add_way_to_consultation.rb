class AddWayToConsultation < ActiveRecord::Migration[7.0]
  def change
    add_column :consultations, :way, :integer
  end
end
