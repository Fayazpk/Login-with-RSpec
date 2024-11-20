require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:user) { User.create!(email: 'user@example.com', password: 'password') }
  describe "GET #new" do
    it "renders the login page" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  describe 'POST #create' do
    context 'with valid credentials' do
      it 'logs the user in and redirects to the dashboard' do
        allow(User).to receive(:authenticate_by).with(email: 'user@example.com', password: 'password').and_return(user)
        post :create, params: { email: 'user@example.com', password: 'password' }
        expect(response).to redirect_to(posts_path)
      end
    end
    context 'with invalid credentials' do
      it 're-renders the login form with an error' do
        allow(User).to receive(:authenticate_by).with(email: 'user@example.com', password: 'wrong_password').and_return(nil)
        post :create, params: { email: 'user@example.com', password: 'wrong_password' }
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  describe 'DELETE #destroy' do
    before do
      allow(controller).to receive(:current_user).and_return(user)
    end
      it 'logout the user and return to login' do
        expect(controller).to receive(:logout).with(user)
        delete :destroy
        expect(response).to redirect_to(root_path)
      end
  end
end
