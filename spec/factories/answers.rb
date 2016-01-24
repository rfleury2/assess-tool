FactoryGirl.define do
  factory :answer do
    content Faker::Company.buzzword
    correct false
    association :question, factory: :question
  end
end
