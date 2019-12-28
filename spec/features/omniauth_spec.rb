# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Omniauth login', type: :feature, js: true do
  scenario 'Succesfully logs in/out an existing user' do
    visit login_path
    have_content 'Sign in with Facebook'
    click_on('Sign in with Facebook')
    expect(page.current_path).to eq '/users/auth/facebook'
  end
end
