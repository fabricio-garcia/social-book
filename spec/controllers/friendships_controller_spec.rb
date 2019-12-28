# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  context 'friendship controller' do
    let(:john) do
      User.create(username: 'John',
                  email: 'john1@example.com',
                  password: 'password')
    end

    let(:matt) do
      User.create(username: 'Matt',
                  email: 'matt1@example.com',
                  password: 'password')
    end

    it 'creates a friendship' do
      expect { Friendship.create(user_id: matt.id, friend_id: john.id) }.to change { Friendship.count }.by(1)
    end

    it 'deletes a friendship' do
      friendship = Friendship.create(user_id: matt.id, friend_id: john.id)
      friendship.delete
      expect(Friendship.count).to eq(0)
    end

    it 'validates uniqueness of a friendship' do
      Friendship.create(user_id: matt.id, friend_id: john.id)
      friendship2 = Friendship.create(user_id: matt.id, friend_id: john.id)
      expect(friendship2).to be_invalid
    end
  end
end
