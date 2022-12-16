class CreateConsultations < ActiveRecord::Migration[7.0]
  def change
    create_table :consultations do |t|
      t.integer :user_id
      t.string :phone
      t.string :mail
      t.text :body

      t.timestamps
    end
  end
end
