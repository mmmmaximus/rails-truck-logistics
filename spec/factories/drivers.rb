FactoryBot.define do
  factory :driver do
    name { FFaker::Name.name }
    license_number { FFaker::Identification.drivers_license }
    mobile_number { '87654321' }
    email_address { FFaker::Internet.email }
    age { rand(18..74) }
    active
    with_truck

    trait :active do
      status { true }
    end

    trait :inactive do
      status { false }
    end

    trait :with_truck do
      after(:create) do |driver|
        create(:truck, drivers: [driver])
      end
    end
  end
end
