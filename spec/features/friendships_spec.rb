# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Friendships', type: :feature do
  scenario 'Succesfully logs in/out' do
    john = User.create(username: 'John',
                       email: 'john@example.com',
                       password: 'password')
    User.create(username: 'Matt',
                email: 'matt@example.com',
                password: 'password')
    user = User.create(username: 'Juana',
                       email: 'juana@example.com',
                       password: 'password')
    Friendship.create(user: user, friend: john)
    visit login_path
    page.fill_in 'user_email', with: 'john@example.com'
    page.fill_in 'user_password', with: 'password'
    click_on(class: 'login')
    click_on 'Users'
    expect(page.current_path).to eq users_path
    find('.add-friend', match: :first).click
    have_content 'Friendship successfully sent'
    have_content 'badge'
    click_on 'Notifications'
    expect(page.current_path).to eq user_friendships_path(john)
    count = Friendship.count
    click_on 'Accept'
    have_content 'Friendship accepted'
    count2 = Friendship.count
    expect(count).not_to eq(count2)
  end
end
