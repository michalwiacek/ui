# frozen_string_literal: true

class Product < ApplicationRecord
  # searchkick

  belongs_to :category

  has_many :products_properties
  has_many :properties, through: :products_properties

  has_many :property_values
  accepts_nested_attributes_for :property_values, reject_if: :all_blank

  validates :name, presence: true

  validate :validate_category


  def validate_category
    errors.add(:category_id, 'must be last node') unless category.childless?
  end

  
  # serialize :properties, Hash

  # validate :validate_properties

  # def validate_properties
  #   category.fields.each do |field|
  #     if field.required && properties[field.name].blank?
  #       errors.add field.name, 'must not be blank'
  #     end
  #   end
  # end
end
