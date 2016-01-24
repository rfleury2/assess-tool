require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:user) { FactoryGirl.create(:user, email: "person@gmail.com", password: 'password') }

  describe "POST create" do
    context 'valid information' do
      before do
        request = post :create, { user: { email: "person@gmail.com", password: 'password' } }
      end

      it 'redirects to home page' do
        expect(request).to redirect_to dashboard_path
      end

      it { should_not set_flash }
    end

    context 'invalid information' do
      before do
        request = post :create, { user: { email: "person@gmail.com", password: 'boo' } }
      end

      it 'renders new template' do
        expect(request).to render_template :new
      end

      it { should set_flash }
    end
  end
end
