# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  it 'adds a comment to a post' do
    user = User.create(username: 'John',
                       email: 'john@example.com',
                       password: 'password')
    post = user.posts.build(content: 'Content of the post')
    post.save
    comment = post.comments.create
    comment.user = user
    comment.save
    expect(Comment.count).to eq(1)
  end
end
