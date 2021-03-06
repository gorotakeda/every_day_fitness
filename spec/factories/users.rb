FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1q' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    profile               { Faker::Lorem.sentence }
    last_name             { '武田' }
    first_name            { '吾郎' }
  end
end 