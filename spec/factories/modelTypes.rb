FactoryBot.define do
  factory :modelType do
    name { FFaker::Name.name }
    brand { FFaker::Name.name }
  end
end
