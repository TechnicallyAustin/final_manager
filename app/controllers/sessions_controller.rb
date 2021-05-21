
class SessionsController < ApplicationController
    def new
    end

    def create
        #byebug
        # find a user in the database and create a session usuing their user.id
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
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
