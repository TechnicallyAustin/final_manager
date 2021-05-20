class UsersController < ApplicationController
    def index
    end

    def show
        find_user
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to :show
        else
            render :new
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
        params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
    end
end
