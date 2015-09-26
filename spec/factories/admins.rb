FactoryGirl.define do
  factory :admin do
  	email       { Faker::Internet.email }   
    password    { Faker::Internet.password(8, 20) }  
  end

end
