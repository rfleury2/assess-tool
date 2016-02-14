FactoryGirl.define do
  factory :assessment do
    title Faker::Hipster.sentence
    association :creator, factory: :user    
  end
end
