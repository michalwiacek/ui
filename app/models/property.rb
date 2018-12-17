class Property < ApplicationRecord
  # searchkick

  has_many :categories_propreties
  has_many :categories, through: :categories_propreties
  has_many :products_propreties
  has_many :properties, through: :products_propreties

  def self.by_name(name)
    where(name: name)
  end

  def self.find_field_type_by_name(name)
    by_name(name).first.field_type.to_sym
  end

  validates :name, presence: :true
  validates :field_type, presence: :true

  validates :options, presence: :true, if: :type_enum?

  def type_enum?
    :field_type == "enum"
  end
end