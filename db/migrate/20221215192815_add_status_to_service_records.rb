# frozen_string_literal: true

class AddStatusToServiceRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :service_records, :status, :integer, default: 0
  end
end
