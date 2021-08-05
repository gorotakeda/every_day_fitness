FactoryBot.define do
  factory :fitness do
    title                  { Faker::Lorem.sentence }
    info                   { Faker::Lorem.sentence }
    category_id            { 1 }
    level_id               { 1 }
    association :user
  end
end
