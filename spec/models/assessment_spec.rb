require 'rails_helper'

RSpec.describe Assessment, type: :model do
  it { should belong_to(:creator).class_name("User") }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:creator) }
end
