class PropertyValue < ApplicationRecord
  belongs_to :property
  belongs_to :product

  validates :field_value, presence: true
end