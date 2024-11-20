require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before do
    assign(:post, Post.new)
  end

  it "displays the 'Create a New Post' heading" do
    render
    expect(rendered).to have_content("Create a New Post")
  end

  it "renders a form for creating a new post" do
    render
    expect(rendered).to have_selector("form[action='#{posts_path}'][method='post']")
  end

  it "has a field for the title with a label" do
    render
    expect(rendered).to have_selector("label", text: "Title")
    expect(rendered).to have_field("post[title]")
  end
end