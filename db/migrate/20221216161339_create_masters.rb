class CreateMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :masters do |t|
      t.string :fio
      t.integer :age
      t.integer :stage
    end
  end
end
