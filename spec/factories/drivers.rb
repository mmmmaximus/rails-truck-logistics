FactoryBot.define do
  factory :driver do
    name { FFaker::Name.name }
    license_number { FFaker::Identification.drivers_license }
    mobile_number { FFaker::PhoneNumberSG.mobile_number }
    email_address { FFaker::Internet.email }
    age { rand(18..74) }
    active

    trait :active do
      status { true }
    end

    trait :inactive do
      status { false }
    end
  end
end
