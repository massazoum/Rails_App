class UsersController < ApplicationController
  def index
    @users = User.includes(posts: :comments).all
  end

  def show
    @user = User.includes(posts: :comments).find(params[:id])
  end
end
