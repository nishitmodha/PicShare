FactoryBot.define do
  factory :comment do
    user_name { Faker::Name.first_name }
    message { "Hello!!!!!" }
    association :photo
    association :user
  end
end