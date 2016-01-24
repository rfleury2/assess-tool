require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET new" do
    before do 
      get :new
    end

    it 'renders new user page' do
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    let(:find_user) { User.find_by(name: "Paolo Maldini") }

    context 'valid user' do
      before do 
        request = post :create, { user: { name: "Paolo Maldini", email: "pmaldini@acmilan.it", password: "sosovalid", password_confirmation: "sosovalid" } }
      end

      it 'creates a valid user' do
        expect(find_user.name).to eq 'Paolo Maldini'
      end

      it 'redirects to home page' do
        expect(request).to redirect_to dashboard_path
      end

      it { should_not set_flash }
    end 

    context 'invalid user' do
      before do 
        request = post :create, { user: { name: "Paolo Maldini", email: "pmaldini@acmilan.it", password: "invalid", password_confirmation: "sosovalid" } }
      end

      it 'creates a valid user' do
        expect(find_user).to be_nil
      end

      it 'redirects to home page' do
        expect(request).to render_template :new
      end

      # TODO: Beef up error section
      it { should set_flash }
    end 
  end
end
