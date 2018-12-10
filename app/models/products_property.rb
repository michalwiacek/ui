class ProductsProperty < ApplicationRecord
  belongs_to :product
  belongs_to :property

  accepts_nested_attributes_for :property, :reject_if => :all_blank
end