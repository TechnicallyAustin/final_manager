class UsersController < ApplicationController

    def show
        find_user
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @user.save
            redirect_to @user
        else
            redirect_to :new
        end
    end

    def edit
        find_user
    end

    def update
        # look into update syntax
    end

    def delete
        find_user.delete
    end

    private

    def find_user
        @user = find_by(id: params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end
end
