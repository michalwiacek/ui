class CreateCategoriesProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :field_type
      t.timestamps
    end

    create_table :categories_properties do |t|
      t.belongs_to :category, index: true
      t.belongs_to :property, index: true
    end

    create_table :products_properties do |t|
      t.belongs_to :product, index: true
      t.belongs_to :property, index: true
    end

    create_table :property_values do |t|
      t.string :field_value
      t.references :property, index: true
      t.references :product, index: true
      t.timestamps
    end
  end
end
