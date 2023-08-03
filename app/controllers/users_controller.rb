# class UsersController < ApplicationController
#   def index
#     @users = User.all
#   end

#   def show
#     @user = User.find(params[:id])
#   end
# end


class UsersController < ApplicationController
  def index
    @users = User.includes(posts: :comments).all
  end

  def show
    @user = User.includes(posts: :comments).find(params[:id])
  end
end
