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
end
