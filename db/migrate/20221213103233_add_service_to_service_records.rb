class AddServiceToServiceRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :service_records, :service_id, :integer
  end
end
