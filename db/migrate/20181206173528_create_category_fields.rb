class CreateCategoryFields < ActiveRecord::Migration[5.2]
  def change
    create_table :category_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
