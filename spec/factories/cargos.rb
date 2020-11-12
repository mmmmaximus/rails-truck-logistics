FactoryBot.define do
  factory :cargo do
    description { FFaker::Lorem.paragraph }
    title { FFaker::Lorem.word }
    reference_number { rand(0..999999) }
    value { FFaker.numerify("#.##") }
  end
end
