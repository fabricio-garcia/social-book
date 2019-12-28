# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates the user attributes' do
    user = User.new(username: '', email: '')
    expect(user).to be_invalid
  end
end
