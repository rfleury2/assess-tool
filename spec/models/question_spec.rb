require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should belong_to(:creator).class_name("User") }
  it { should have_many(:answers) }
  it { should have_and_belong_to_many(:assessments) }

  it { should validate_presence_of(:prompt) }
end
