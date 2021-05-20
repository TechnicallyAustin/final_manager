class SessionsController < ApplicationController
    def new
    end

    def create
        # find a user in the database and create a session usuing their user.id
    end

    def login
        # set the session user_id to the current logged in user's id
    end

    def destroy
        # Empty the sessions Hash
    end
end
