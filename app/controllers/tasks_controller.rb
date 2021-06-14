class TasksController < ApplicationController
    # before action authenticate user
    def index
        @tasks = Task.all
    end

    def show
        current_task

    end

    def new
        @task = Task.new
        @task.group = Group.new
    end

    def create
        # adds the newly created tasks to an existing tasklist
        # could be an add method in the tasklist index. Using check boxes that toggles the add method.
        @task = Task.new(task_params)
        @task.group = Group.find_or_create_by(task_params[:group_attributes])

        if @task.valid?
            @task.save
            redirect_to tasks_path(@task)
        else
            render :new
        end
    end

    def edit
        current_task
    end

    def update
        current_task
        @task.update(task_params)

        if @task.valid?
            @task.save
            redirect_to task_path(@task)
        else
            render :edit
        end
    end

    private

    def current_task
        @task = Task.find_by(id: params[:id])
    end

    def task_params
        params.require(:task).permit(:name, :due_date, :completed, :user_id, :tasklist_id, group_attributes: [:name, :description])
    end

    def tasklist_finder
        @tasklist = Tasklist.find_by_id(id: params[:task][:tasklist_id])
    end
end