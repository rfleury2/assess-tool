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
  end
end
