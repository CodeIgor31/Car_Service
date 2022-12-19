# frozen_string_literal: true

class AddAboutToMasters < ActiveRecord::Migration[7.0]
  def change
    add_column :masters, :about, :text
  end
end
