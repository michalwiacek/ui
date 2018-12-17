class AddFieldToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :is_last, :boolean, default: false
    add_column :categories, :twin_id, :integer, index: true
  end
end
