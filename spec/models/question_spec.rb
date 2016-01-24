require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should belong_to(:creator).class_name("User") }

  it { should validate_presence_of(:prompt) }
end
