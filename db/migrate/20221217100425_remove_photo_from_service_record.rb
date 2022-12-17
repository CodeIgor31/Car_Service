class RemovePhotoFromServiceRecord < ActiveRecord::Migration[7.0]
  def change
    remove_column :service_records, :photo, :string
  end
end
