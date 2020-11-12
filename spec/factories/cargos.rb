FactoryBot.define do
  factory :cargo do
    association :truck
    description { FFaker::Lorem.paragraph }
    title { FFaker::Lorem.word }
    reference_number { rand(0..999999) }
    value { rand(0.00..10_000.00).round(2) }
  end
end
