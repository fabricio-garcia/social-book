# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'AddComments', type: :feature do
  scenario 'A logged user can post a comment' do
    User.create(username: 'John',
                email: 'john@example.com',
                password: 'password')
    visit login_path
    page.fill_in 'user_email', with: 'john@example.com'
    page.fill_in 'user_password', with: 'password'
    click_on(class: 'login')
    page.fill_in 'post_content', with: 'This is a post'
    click_on 'Post'
    have_content 'This is a post'
    page.fill_in 'comment_content', with: 'This is a comment'
    click_on 'Comment'
    have_content 'This is a comment'
  end
end
