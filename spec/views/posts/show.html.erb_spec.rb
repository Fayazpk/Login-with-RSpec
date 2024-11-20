require 'rails_helper'

RSpec.describe "posts/show.html.erb", type: :view do
  before{
    @post = assign(:post, Post.create!(id: 1,title: "faaewwef",description: "pawefewfef"))
  }
  it "displays the post ID" do
    render
    expect(rendered).to include(@post.id.to_s)
  end

 

  it "displays the post description" do
    render
    expect(rendered).to have_selector("p", text: @post.description)
  end

  it "displays the back link" do
    render
    expect(rendered).to have_link("Back", href: posts_path)
  end

  


end
