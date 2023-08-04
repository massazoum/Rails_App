# class ApplicationController < ActionController::Base
#   before_action :set_current_user

#   private

#   def set_current_user
#     @current_user = User.first # Replace this with proper authentication logic in future projects
#   end
# end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :email, :password, :current_password)}
  end
end