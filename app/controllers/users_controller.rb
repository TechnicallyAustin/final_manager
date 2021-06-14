class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        current_user
        # VV creates a variable so i can use my table partial. chains on my scope method to only display Tasks due this week.
        @tasks = current_user.tasks.this_week
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        @user.email.downcase!
        
        if @user.save
          flash[:notice] = "Successfully created Account!"
          redirect_to root_path
        else
          # If user fails model validation - probably a bad password or duplicate email:
          flash.now.alert = "Error creating account. Please check your details and try again."
          render :new
        end
      
    end

    def edit
        current_user
    end

    def update
        # look into update syntax
    end

    private

    def find_user
        @user = User.find_by(id: params[:id])
    end

    def current_tasklist
        @tasklist = current_user.Tasklist.find_by(id: params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :lname, :username, :password, :password_confirmation)
    end

end
