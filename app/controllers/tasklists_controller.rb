class TasklistsController < ApplicationController
    # before action authenticate user
    def index
        @tasklists = current_user.tasklists.all
    end

    def show
        current_tasklist
        @task = Task.new
    end

    def new
        @tasklist = Tasklist.new
    end

    def create
        # Creation works with strong params
        @tasklist = Tasklist.new(tasklist_params)
        if @tasklist.valid?
            @tasklist.save
            redirect_to @tasklist
        else
            render :new
        end



    end

    def edit
    end

    def update
    end

    private

    def current_tasklist
        @tasklist = Tasklist.find_by(id: params[:id])
    end

    def tasklist_params
        params.require(:tasklist).permit(:user_id, :title, :description)
    end

end
