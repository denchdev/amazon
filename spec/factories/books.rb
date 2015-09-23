FactoryGirl.define do
  factory :book do
    title        { Faker::Book.title }
    description  { Faker::Lorem.paragraph }
    price        { Faker::Commerce.price }
    stock        { Faker::Number.between(1, 100) }
  end
end