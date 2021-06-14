class SessionsController < ApplicationController
    before_action :authenticate_user!, execpt: [:welcome, :new, :destroy]
    def new
        # Nothing to do Here
    end

    def create
        @user = User.find_by(email: params[:email])
        session[:user_id] = @user.id
        redirect_to @user 
    end

    def login
        # set the session user_id to the current logged in user's id
    end

    def destroy
        # Empty the sessions Hash
        session[:user_id].delete 
    end
end
