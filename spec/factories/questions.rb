FactoryGirl.define do
  factory :question do
    prompt Faker::Hipster.sentence #=> "Park iphone leggings put a bird on it."
    association :creator, factory: :user
  end
end
