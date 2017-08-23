class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :configure＿permitted＿parameters, if: :devise_controller?

  def configure＿permitted＿parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
