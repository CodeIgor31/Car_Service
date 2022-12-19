class AddVacancyToWork < ActiveRecord::Migration[7.0]
  def change
    add_column :works, :vacancy_id, :integer
  end
end
