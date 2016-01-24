require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { Question.find_by(prompt: "Who's the boom king?") }

  before do 
    allow(controller).to receive(:current_user) { user }
  end

  describe 'POST create' do
    describe 'valid question' do
      before do 
        request = post :create, { question: { prompt: "Who's the boom king?" } }
      end

      it 'is associated with the correct user' do
        expect(question.creator).to eq user
      end

      it 'redirects to the dashboard' do
        expect(request).to redirect_to dashboard_path
      end

      it { should_not set_flash }
    end

    describe 'empty question' do
      before do 
        request = post :create, { question: { prompt: "" } }
      end

      it 'renders new template' do
        expect(request).to render_template :new
      end

      it { should set_flash }
    end
  end
end
