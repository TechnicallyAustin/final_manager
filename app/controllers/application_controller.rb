class ApplicationController < ActionController::Base
    # added the User attributes to the devise strong params so that a new user can be created.
    before_action :configure_permitted_parameters, if: :devise_controller?
    # Strong params for Devise 
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lname, :email, :password, :password_confirmation])
      end
end
