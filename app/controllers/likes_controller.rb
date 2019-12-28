# frozen_string_literal: true

# before_action :find_like, only: [:destroy]

class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(like_params)
    @like.user = current_user
    redirect_back(fallback_location: root_path) if @like.save
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
