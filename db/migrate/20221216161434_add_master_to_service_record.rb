# frozen_string_literal: true

class AddMasterToServiceRecord < ActiveRecord::Migration[7.0]
  def change
    add_column :service_records, :master_id, :integer
  end
end
