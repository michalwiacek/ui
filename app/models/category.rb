# frozen_string_literal: true

class Category < ApplicationRecord
  has_ancestry

  has_many :products, dependent: :destroy
  has_many :fields, class_name: 'CategoryField', dependent: :destroy

  accepts_nested_attributes_for :fields, allow_destroy: true
end
