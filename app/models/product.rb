# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category

  serialize :properties, Hash

  validate :validate_properties

  def validate_properties
    category.fields.each do |field|
      if field.required && properties[field.name].blank?
        errors.add field.name, 'must not be blank'
      end
    end
  end
end
