require 'rails_helper'

RSpec.describe User, type: :model do
  context 'email validations' do
    let(:valid_user) { FactoryGirl.build(:user, email: "hello@example.com") }
    let(:invalid_user) { FactoryGirl.build(:user, email: "invalid") }
    let(:invalid_user2) { FactoryGirl.build(:user, email: "invalid@invalid") }
    
    it "allows valid email" do
      expect(valid_user.save).to eq true
    end

    it "does not allow invalid email formats" do
      expect(invalid_user.save).to eq false
      expect(invalid_user2.save).to eq false
    end
    
    it { should validate_uniqueness_of(:email) }

    it { should validate_presence_of(:email) }
  end 

  it { should have_many :assessments }

  it { should have_many :questions }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:password) }

  it { should validate_confirmation_of(:password) }

  it { should validate_length_of(:password).is_at_least(6) }
end
