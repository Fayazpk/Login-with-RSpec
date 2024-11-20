require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "GET #new" do
    it "renders the sign-up page" do
      get new_registration_path
      expect(response).to have_http_status(:ok)
    end
  end
  describe "POST #create" do
    it 'login and redirect to index' do
      post registration_path,
      params: {user: {email:'user@example.com', password:"password", password_confirmation: "password"}}
      expect(response).to redirect_to(posts_path)
    end
  end

  context 'password mismatch or no email' do
    it 'it render sign up page with error' do
      post registration_path,
      params: {user: { email:  "",password: "password",password_confirmation: "otherpassword"}}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
