# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# categories
l30 = %w(Opel Mercedes Tesla)
l31 = %w(Apple Samsung Google)

root = Category.create!(name: 'Root')
root.properties.create!([{name: "Cena", field_type: "decimal"},{name: "Uzywany", field_type: "boolean"}])

l2 = Category.create!([{name: "Samochody", parent: root}, {name: "Telefony", parent: root}])

l2.first.properties.create!([{name: "Rocznik", field_type: "integer"},{name: "Przebieg", field_type: "integer"}])
l2.last.properties.create!([{name: "Wersja", field_type: 'integer'},{name: 'System operacyjny', field_type: "string"}])

l30.each do |name|
  Category.create!(name: name, parent: l2.first)
end

l31.each do |name|
  Category.create!(name: name, parent: l2.last)
end

# products

