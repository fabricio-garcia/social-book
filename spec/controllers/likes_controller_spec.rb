# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  it 'adds a like to a post' do
    user = User.create(username: 'John',
                       email: 'john@example.com',
                       password: 'password')
    post = user.posts.build(content: 'Content of the post')
    post.save
    like = post.likes.create
    like.user = user
    like.save
    expect(Like.count).to eq(1)
  end
end
