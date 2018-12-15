FactoryBot.define do
    factory :category do
        sequence(:name) { |n| "ABC Institution" }
        
        trait :with_parent do
            after(:build) do |o|
            o.parent = FactoryBot.create(:category) 
            end
        end
    end
end