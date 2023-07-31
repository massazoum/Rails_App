class LikesController < ApplicationController
  def new
    @post = Post.find(params[:post_id]) # Assuming you have a `post_id` parameter in the request
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @like = @current_user.likes.build(post: @post)
    if @like.save
      redirect_to @post, notice: 'Liked the post!'
    else
      redirect_to @post, alert: 'Failed to like the post.'
    end
  end
end
