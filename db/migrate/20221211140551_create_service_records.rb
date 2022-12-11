class CreateServiceRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :service_records do |t|
      t.text :trouble
      t.date :date
      t.integer :user_id
    end
  end
end
