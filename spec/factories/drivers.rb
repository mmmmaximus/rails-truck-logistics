FactoryBot.define do
  factory :driver do
    name { FFaker::Name.name }
    license_number {  }
    mobile_number { FFaker::PhoneNumberSG }
    email_address { FFaker::Internet.email }
    age { rand(18..74) }

    trait :active do
      status { true }
    end

    trait :inactive do
      status { false }
    end
  end
end
