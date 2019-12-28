# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]

  def new; end

  def create; end

  def show
    @user = User.find(params[:id])
    @comment = Comment.new
    @post = Post.new
    @like = Like.new
  end

  def index
    @users = User.all
    @friendship = Friendship.new
  end
end
