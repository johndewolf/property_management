# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    first_name "Al"
    last_name "Capone"
    email "AlCapone@gmail.com"
    company "Mafia"
  end
end
