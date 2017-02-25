FactoryGirl.define do
  factory :user do
    name            { Faker::GameOfThrones.character }
    email           { Faker::Internet.email }
    password "password"
  end
end
