class ApplicationController < ActionController::Base
 before_action :set_current_user

  private

  def set_current_user
    @current_user = User.first # Replace this with proper authentication logic in future projects
  end
end
