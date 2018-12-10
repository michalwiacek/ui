# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :ancestry, index: true

      t.timestamps
    end

    create_table :products do |t|
      t.string :name
      t.decimal :price
    end
  end
end
