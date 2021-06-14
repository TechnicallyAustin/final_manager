class TasklistsController < ApplicationController
    # before action authenticate user
    def index
        @tasklists = current_user.tasklists.all
    end

    def show
        current_tasklist
        @tasks = current_tasklist.tasks

    end

    def new
        @tasklist = Tasklist.new
    end

    def create
        @tasklist = Tasklist.new(tasklist_params)
        if @tasklist.valid?
            @tasklist.save
            redirect_to @tasklist
        else
            render :new
        end
    end

    def edit
        current_tasklist
    end

    def update
        current_tasklist
        @tasklist.update(tasklist_params)
        if @tasklist.valid?
            @tasklist.save
            redirect_to tasklist_path(@tasklist)
        else
            render :edit
        end
    end

    private

    def current_tasklist
        @tasklist = Tasklist.find_by(id: params[:id])
    end

    def tasklist_params
        params.require(:tasklist).permit(:user_id, :title, :description)
    end

end
