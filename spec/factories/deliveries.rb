FactoryGirl.define do
  factory :delivery do
    sequence(:name) { |n| "Delivery#{Faker::Lorem.word}#{n}" }
    price { Faker::Commerce.price }
  end
end
