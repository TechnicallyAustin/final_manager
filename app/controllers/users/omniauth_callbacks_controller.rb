class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
  @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      flash[:error] = "There was a problem signing you in with Google. Please try again or sign up normally."
      redirect_to new_user_registration_path
    end
  end
  
    protected
  
    def after_omniauth_failure_path_for(_scope)
      new_user_session_path
    end
  
    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || root_path
    end
  
    private
  
    def from_google_params
      @from_google_params ||= {
        uid: auth.uid,
        email: auth.info.email,
        full_name: auth.info.name,
        avatar_url: auth.info.image
      }
    end
  
    def auth
      @auth ||= request.env['omniauth.auth']
    end
  end