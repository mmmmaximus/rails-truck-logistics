FactoryBot.define do
  factory :route do
    association :truck
    name { FFaker::Name.name }
    length_of_time { rand(1..500) }
  end
end
