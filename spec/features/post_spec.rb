# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'A user posts successfully' do
    User.create(username: 'John',
                email: 'john@example.com',
                password: 'password')
    visit login_path
    page.fill_in 'user_email', with: 'john@example.com'
    page.fill_in 'user_password', with: 'password'
    click_on(class: 'login')
    page.fill_in 'post_content', with: 'Testing the post feature'
    click_on 'Post'
    have_content 'Post created'
  end
end
