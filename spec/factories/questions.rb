FactoryGirl.define do
  factory :question do
    prompt { Faker::Hipster.sentence }
    association :creator, factory: :user
  end
end
