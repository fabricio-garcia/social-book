# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.create(username: 'John',
                email: 'john@example.com',
                password: 'password')
  end

  it 'validates the content' do
    post = Post.new(content: '')
    expect(post).to be_invalid
  end

  it 'has a user as a creator' do
    post = user.posts.build(content: 'Blablabla')
    expect(post.user.id).to eq(user.id)
  end
end
