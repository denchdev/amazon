FactoryGirl.define do
  factory :customer do
    email      { Faker::Internet.email }
    firstname  { Faker::Name.first_name }
    lastname   { Faker::Name.last_name }
    password   { Faker::Internet.password(8, 20) }  
    
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
