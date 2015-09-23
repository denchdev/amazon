FactoryGirl.define do
  factory :customer do
    email       { Faker::Internet.email }
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    password    "password"
    avatar      { Faker::Avatar.image }

    factory :facebook_user do
      provider  "facebook"
      uid       { Faker::Number.number(15) }
    end

    factory :user_with_addresses do
      association :shipping_address, factory: :address
      association :billing_address, factory: :address
    end
  end
end
