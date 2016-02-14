FactoryGirl.define do
  factory :question do
    prompt "Who was president of Brazil in 1991?"
    association :creator, factory: :user
  end
end
