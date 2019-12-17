# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created'
      redirect_to root_path
    else
      flash.now[:danger] = 'Try again'
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    @user = @post.user
  end

  def index
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
    @comments = @post.comments
    @comment = @post.comments.new
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
