class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments) # Eager loading comments
    @posts = @user.posts.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id]) # Eager loading comments
  end

  def new                   
    @post = Post.new
  end

  def create
    @post = @current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end
end
