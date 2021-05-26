class TasksController < ApplicationController
    # before action authenticate user
    def index
    end

    def show
        current_task
    end

    def new
        @task = Task.new
        @task.group = Group.new

        if @task.save
            redirect_to task_path(@task)
        else
            render :new
        end

    end

    def create
        # @task.save! = Validation failed: Tasklist must exist, Group must exist, Due date can't be blank
        byebug
        @task = Task.new(task_params)
    end

    def edit
    end

    def update
    end

    private

    def current_task
        @task = Task.find_by(id: params[:id])
    end

    # Needs to take Nested Group Param.
    def task_params
        params.require(:task).permit(:name, :due_date, :completed, :user_id, groups_attributes: [:name, :description])
    end

end
