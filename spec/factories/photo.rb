FactoryBot.define do
  factory :photo do
    title { "Factory Title" }
    description { "Factory Desc" }
    association :user
  end
end