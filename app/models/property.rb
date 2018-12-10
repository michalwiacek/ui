class Property < ApplicationRecord
 has_many :categories_propreties
 has_many :categories, through: :categories_propreties
 has_many :products_propreties
 has_many :properties, through: :products_propreties
end