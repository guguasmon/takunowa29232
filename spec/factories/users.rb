FactoryBot.define do
  factory :user do
    uid { 123_456 }
    nickname { Faker::Name.first_name}
    name {Faker::Name.initials(number: 2)}
    image {Faker::Lorem.sentence}
  end
end
