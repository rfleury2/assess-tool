require 'rails_helper'

RSpec.describe AssessmentsController, type: :controller do
  describe 'POST create' do
    let(:creator) { FactoryGirl.create(:user) }
    let(:assessment) { Assessment.find_by(title: "Valid Assessment") }
    let(:assessment_params) do
      { assessment: { creator: creator, title: "Valid Assessment" } }
    end 
    let(:invalid_params) do
      { assessment: { creator: creator, title: "" } }
    end 


    before do
      allow(controller).to receive(:current_user) { creator }
    end

    describe 'valid' do
      before do
        request = post :create, assessment_params
      end

      it 'redirects to add questions' do
        expect(request).to redirect_to assessment_add_questions_path(assessment)
      end

      it 'assigns to right attributes' do
        expect(assessment.title).to eq 'Valid Assessment'
        expect(assessment.creator).to eq creator
      end

      it { should_not set_flash }
    end

    describe 'invalid' do
      before do
        request = post :create, invalid_params
      end

      it 're renders new' do
        expect(request).to render_template :new
      end

      it { should set_flash }
    end
  end

  describe 'get SHOW' do
    let(:assessment) { FactoryGirl.create(:assessment, :with_questions) }

    before do
      expect(assessment.questions).to_not be_empty
      request = get :show, { id: assessment.id }
    end

    it 'renders proper show' do
      expect(request).to render_template :show
    end
  end

  describe 'get ADD_QUESTIONS' do
    let(:assessment) { FactoryGirl.create(:assessment) }

    before do
      get :add_questions, { assessment_id: assessment.id }
    end

    it 'renders proper page' do
      expect(request).to render_template :add_questions
    end
  end

  describe 'put ASSIGN_QUESTIONS' do
    let(:first_question) { FactoryGirl.create(:question) }
    let(:second_question) { FactoryGirl.create(:question) }
    let(:assessment) { FactoryGirl.create(:assessment) }
    let(:question_ids) { [first_question.id, second_question.id] }

    before do 
      request = put :assign_questions, 
      { assessment_id: assessment.id, 
        assessment: { question_ids: question_ids } }
    end

    it 'assigns the questions to the assessment' do
      expect(assessment.questions).to include(first_question)
      expect(assessment.questions).to include(second_question)
    end
  end
end
