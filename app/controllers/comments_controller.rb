# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    redirect_back(fallback_location: root_path) if @comment.save
  end

  def show
    @comments = @post.comments
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
