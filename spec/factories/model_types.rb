FactoryBot.define do
  factory :model_type do
    name { FFaker::Name.name }
    brand { FFaker::Name.name }
  end
end
