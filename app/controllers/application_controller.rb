class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :website, :phone, :gender, :bio])
        devise_parameter_sanitizer.permit(:account_update , keys: [:username, :name, :website, :phone, :gender, :bio])
    end
end
