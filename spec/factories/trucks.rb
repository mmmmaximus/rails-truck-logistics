FactoryBot.define do
  factory :truck do
    association :model_type
    sequence(:license_plate) { |n| "#{FFaker::Lorem.word}#{n}" }
    capacity { rand(10_000..50_000) }
    color { FFaker::Vehicle.base_color }
    service_date { Date.current }
    active

    trait :active do
      status { 'active' }
    end

    trait :inactive do
      status { 'inactive' }
    end

    trait :servicing do
      status { 'servicing' }
    end

    trait :with_cargo do
      after(:create) do |truck|
        create(:cargo, truck: truck)
      end
    end

    trait :with_routes do
      after(:create) do |truck|
        create(:route, truck: truck)
      end
    end

    trait :with_driver do
      after(:create) do |truck|
        create(:driver, trucks: [truck])
      end
    end
  end
end
