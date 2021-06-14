class OmniauthController < ApplicationController
    def google_oauth2
        @user = User.from_omniauth(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in @user, event: :authentication 
            sign_in_and_redirect @user
        else
            failure
        end
    end

    def failure
        flash[:error] = "There was a problem signing you in with Google. Please try again or sign up using Final Manager."
        redirect_to new_user_registration_path
    end

end
