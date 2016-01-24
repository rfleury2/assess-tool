require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:question) { FactoryGirl.create(:question) }
  let(:valid_params) do
    { question_id: question.id,
      answer: { content: "Guess 1", correct: false } }
  end
  let(:invalid_params) do
    { question_id: question.id,
      answer: { content: "", correct: false } }
  end

  describe 'POST create' do
    describe 'valid answer' do
      before do
        request = xhr(:post, :create, valid_params)
      end

      it 'renders proper template' do
        expect(request).to render_template 'answers/_answer'
      end

      it 'saves answer' do
        answer = Answer.find_by(valid_params[:answer])
        expect(answer.content).to eq 'Guess 1'
        expect(answer.correct).to eq false
      end

      it { should_not set_flash }
    end

    describe 'invalid answer' do
      before do
        request = xhr(:post, :create, invalid_params)
      end

      it 'renders errors' do
        expect(request).to render_template 'shared/_errors'
      end

      it { should set_flash }

      it 'does not save answer' do
        answer = Answer.find_by(invalid_params[:answer])
        expect(answer).to be_nil
      end
    end
  end
end
