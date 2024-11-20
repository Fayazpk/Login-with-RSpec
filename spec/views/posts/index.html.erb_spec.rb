require 'rails_helper'

RSpec.describe "posts/index.html.erb", type: :view do
  before do
    assign(:posts, [
      Post.create!(title: "First Post", description: "Description of the first post"),
      Post.create!(title: "Second Post", description: "Description of the second post")
    ])
  end

  it "displays the title 'Home Page'" do
    render
    expect(rendered).to have_content("Home Page")
  end

  it "has a link to create a new post" do
    render
    expect(rendered).to have_link("Create Post", href: new_post_path)
  end

end
