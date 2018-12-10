# frozen_string_literal: true

class AddCategoryToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :category_id, :integer
  end
end
