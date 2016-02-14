require 'rails_helper'

RSpec.describe Assessment, type: :model do
  it { should belong_to(:creator).class_name("User") }
  it { should have_and_belong_to_many(:questions) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:creator) }

end
