# frozen_string_literal: true

module FriendshipsHelper
  def pending?(user)
    pending_friends = current_user.pending_friends
    pending_friends.include?(user)
  end
end
