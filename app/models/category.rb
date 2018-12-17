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

  validate :parent_must_not_be_leaf

  before_save :duplicate_twin_properties

  def self.branch
    where(id: Category.select(:ancestry).distinct.pluck(:ancestry).compact.map { |x| x.split('/') }.flatten.uniq )
  end
  
  def self.not_final
    where(is_last: false)
  end
  
  def self.unpopulated
    includes(:products).where(products: {id: nil})
  end 
  
  def self.populated
    includes(:products).where.not(products: {id: nil})
  end 
  
  def parent_must_not_be_leaf
    errors.add(:parent_id, 'must not be leaf') if parent.is_last
  end

  def duplicate_twin_properties
    binding.pry
    properties << Category.find(twin_id).properties if twin_id
    binding.pry
  end
end
