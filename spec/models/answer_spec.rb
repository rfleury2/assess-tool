require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should belong_to(:question) }

  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:question_id) }

  describe 'validate boolean' do
    it 'allows "true" for :correct' do
      answer = FactoryGirl.build(:answer, correct: true)
      expect(answer.save).to eq true
    end 

    it 'allows "false" for :correct' do
      answer = FactoryGirl.build(:answer)
      expect(answer.save).to eq true
    end
  end
end
