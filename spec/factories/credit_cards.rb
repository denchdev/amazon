FactoryGirl.define do
  factory :credit_card do
    number            {  CreditCardValidations::Factory.random(:maestro) }
    CVV               { Faker::Number.number(3) }
    expiration_month  { |variable|     Faker::Number.between(1, 12) }
    expiration_year   { Faker::Date.between(Date.today + 1.year, Date.today + 10.years).year }
    firstname         { Faker::Name.first_name }
    lastname          { Faker::Name.last_name }    
  end
end
