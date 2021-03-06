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

  describe 'GET edit' do
    let(:answer) { FactoryGirl.create(:answer) }

    before do
      request = xhr(:get, :edit, { id: answer.id, question_id: answer.question.id })
    end

    it 'renders form template' do
      expect(request).to render_template 'answers/_edit'
    end
  end

  describe 'PUT update' do
    let!(:answer) { FactoryGirl.create(:answer) }
    let(:valid_params) do
      { id: answer.id,
        question_id: answer.question.id,
        answer: { content: 'new content', correct: true }
      }
    end
    let(:invalid_params) do
      { id: answer.id,
        question_id: answer.question.id,
        answer: { content: '', correct: true } }
    end

    describe 'valid' do
      before do
        request = xhr(:put, :update, valid_params)
      end

      it 'renders the new answer' do
        expect(request).to render_template 'answers/_answer'
      end

      it 'updates its attributes' do
        find_answer = Answer.find(answer.id)
        expect(find_answer.content).to eq 'new content'
        expect(find_answer.correct).to eq true
      end

      it { should_not set_flash }
    end

    describe 'invalid' do
      before do
        request = xhr(:put, :update, invalid_params)
      end

      it 'renders error template' do
        expect(request).to render_template 'shared/_errors'
      end

      it 'does not update its attributes' do
        find_answer = Answer.find(answer.id)
        expect(find_answer.content).to eq answer.content
        expect(find_answer.correct).to eq answer.correct
      end

      it { should set_flash }
    end
  end

  describe 'DELETE destroy' do
    describe 'valid answer' do
      let!(:valid_answer) { FactoryGirl.create(:answer) }
      let(:valid_params) do
        { question_id: valid_answer.question.id,
          id: valid_answer.id }
      end
 
      before do
        request = xhr(:delete, :destroy, valid_params)
      end

      it 'renders nothing with status 200' do
        expect(request).to render_template nil, status: 200
      end
    end

    describe 'valid answer' do
      let(:valid_params) do
        { question_id: 9999,
          id: 9999 }
      end
    
      before do
        request = xhr(:delete, :destroy, valid_params)
      end

      it 'renders nothing with status 400' do
        expect(request).to render_template nil, status: 400
      end
    end
  end
end
