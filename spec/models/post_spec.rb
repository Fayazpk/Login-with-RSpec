require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'the title and descrption should be valid'  do
    post = Post.new(title: 'anything',description: 'anything' )
    expect(post).to be_valid
  end
  it 'NO title and descrption should be not valid'  do
    post = Post.new(title: '',description: '' )
    expect(post).to_not be_valid
  end
end
