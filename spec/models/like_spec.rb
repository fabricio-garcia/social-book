# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'validates post and user presence' do
    like = Like.new
    like.save
    expect(like).to be_invalid
  end
end
