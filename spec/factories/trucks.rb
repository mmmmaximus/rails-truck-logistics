FactoryBot.define do
  factory :truck do
    sequence(:license_plate) { |n| "#{FFaker::Lorem.word}#{n}" }
    capacity { rand(10_000..50_000) }
    # model_type_id { }
    color { FFaker::Vehicle.base_color }
    service_date { Date.current }
    active
    # drivers_id { }

    trait :active do
      status { 'active' }
    end

    trait :inactive do
      status { 'inactive' }
    end

    trait :inactive do
      status { 'inactive' }
    end
  end
end
