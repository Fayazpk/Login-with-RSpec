# spec/requests/welcomes_spec.rb
require 'rails_helper'

RSpec.describe "Welcomes", type: :request do
  describe "GET /index" do
    it "renders the index page successfully" do
      get root_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Welcome to MyApp")
      expect(response.body).to include("Sign up")
      expect(response.body).to include("Log in")
    end
  end
end
