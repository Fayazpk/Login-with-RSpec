require 'rails_helper'

RSpec.describe "posts/edit.html.erb", type: :view do
  before do
    @post = assign(:post, Post.create!(title: "Sample Title", description: "Sample Description"))
  end

  it 'renders the edit page with the correct heading' do
    render
    expect(rendered).to have_selector("h1", text: "Edit Post")
  end

  it 'renders the form for editing the post' do
    render
    expect(rendered).to have_selector("form[action='#{post_path(@post)}'][method='post']")
    expect(rendered).to have_selector("input[name='post[title]'][value='Sample Title']")
    expect(rendered).to have_selector("textarea[name='post[description]']", text: "Sample Description")
    expect(rendered).to have_selector("input[type='submit'][value='Submit']")
  end

  it 'renders the error messages block if there are errors' do
    @post.errors.add(:title, "can't be blank")
    @post.errors.add(:description, "can't be blank")
    render

    # Check for the error block
    expect(rendered).to have_selector("div.alert.alert-danger")
    expect(rendered).to have_selector("h2", text: "2 errors prohibited this post from being saved:")
    expect(rendered).to have_selector("ul > li", text: "Title can't be blank")
    expect(rendered).to have_selector("ul > li", text: "Description can't be blank")
  end

  it 'renders the back link' do
    render
    expect(rendered).to have_link("Back", href: posts_path)
  end
end
