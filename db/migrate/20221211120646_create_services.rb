class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :image
    end
    add_index :services, :title, unique: true
  end
end
