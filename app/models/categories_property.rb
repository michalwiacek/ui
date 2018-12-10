class CategoriesProperty < ApplicationRecord
  belongs_to :category
  belongs_to :property

  accepts_nested_attributes_for :property, :reject_if => :all_blank
end