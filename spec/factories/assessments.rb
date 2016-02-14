FactoryGirl.define do
  factory :assessment do
    title Faker::Company.buzzword
    association :creator, factory: :user
  end

  trait :with_questions do
    after(:create) { |assessment| assessment.questions << FactoryGirl.create(:question) }
  end
end