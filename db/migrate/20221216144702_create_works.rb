class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works do |t|
      t.integer :user_id
      t.integer :age
      t.integer :male
      t.text :about
      t.string :task_1
      t.string :task_2
      t.string :task_3

      t.timestamps
    end
  end
end
