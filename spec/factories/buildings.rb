# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    address "1 Summer Ave"
    city "Boston"
    state "MA"
    postal_code "03062"
    description ""
    owner_id 1

    owner
  end
end
