FactoryGirl.define do
  factory :assessment do
    title { Faker::Company.buzzword }
    association :creator, factory: :user
  end

  trait :with_questions do
    after(:create) do |assessment| 
      assessment.questions << FactoryGirl.create(
        :question, creator: FactoryGirl.build(:user))
    end
  end
end