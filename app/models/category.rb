class Category < ApplicationRecord
  has_ancestry
  
  has_many :products
  has_many :fields, class_name: "CategoryField"

  accepts_nested_attributes_for :fields, allow_destroy: true
end
