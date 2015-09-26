FactoryGirl.define do
  factory :book do
    title        { Faker::Lorem.sentence }
    description  { Faker::Lorem.paragraph }
    price        { Faker::Commerce.price }
    stock        { Faker::Number.between(1, 100) }
    image        { Faker::Avatar.image }
    author
    category
  end
end