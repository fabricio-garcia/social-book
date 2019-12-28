# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'validates post and user presence' do
    comment = Comment.new
    comment.save
    expect(comment).to be_invalid
  end
end
