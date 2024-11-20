require 'rails_helper'

RSpec.describe User, type: :model do
 it 'is valid with a unique email' do
  user = User.new(email: 'test@example.com', password: 'password123')
  expect(user).to be_valid
 end
 it 'is invalid without an email' do
  user = User.new(email: nil, password: 'password123')
  expect(user).to_not be_valid
end

it 'is invalid without an password' do
  user = User.new(email: 'test@example.com', password: nil)
  expect(user).to_not be_valid
end
it 'is invalid with a duplicate email' do
  User.create!(email: 'test@example.com', password: 'password123')
  duplicate_user = User.new(email: 'test@example.com', password: 'password123')
  expect(duplicate_user).to_not be_valid
end
end
