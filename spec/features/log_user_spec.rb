# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Log in and out', type: :feature do
  scenario 'Succesfully logs in/out an existing user' do
    User.create(username: 'John',
                       email: 'john@example.com',
                       password: 'password')
    visit login_path
    page.fill_in 'user_email', with: 'john@example.com'
    page.fill_in 'user_password', with: 'password'
    click_on(class: 'login')
    expect(page.current_path).to eq root_path
    have_link 'Users', href: users_path
    have_link 'Log out', href: destroy_user_session_path
    have_content 'posts-list'
    click_on 'Log out'
    expect(page.current_path).to eq new_user_session_path
    have_content 'Log in'
  end
end
