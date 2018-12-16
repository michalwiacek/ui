# frozen_string_literal: true

class Category < ApplicationRecord
  has_ancestry

  has_many :products, dependent: :destroy
  has_many :fields, class_name: 'CategoryField', dependent: :destroy

  has_many :categories_properties
  has_many :properties, through: :categories_properties

  accepts_nested_attributes_for :fields, allow_destroy: true
  accepts_nested_attributes_for :categories_properties, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :properties, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true

  def self.branch
    where(id: Category.select(:ancestry).distinct.pluck(:ancestry).compact.map { |x| x.split('/') }.flatten.uniq )
  end

  def self.unpopulated
    includes(:products).where(products: {id: nil})
  end 
  
  def self.unpopulated
    includes(:products).where.not(products: {id: nil})
  end 
end
