require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:post) { Post.create!(title: "Sample Title", description: "Sample Description") }

  describe "GET /index" do
    it "returns http success" do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get post_path(post) 
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_post_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_post_path(post)
      expect(response).to have_http_status(:success)
    end
  end
end
