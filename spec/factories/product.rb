FactoryBot.define do
    factory :product do
        association :category
        name { "Canon 5d mark III" }
    end
end