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

        #byebug
    end

    def create
        # @tasklists.tasks << @task
        # adds the newly created tasks to an existing tasklist
        # could be an add method in the tasklist index. Using check boxes that toggles the add method.
        @task = Task.new(task_params)
        @task.group = Group.find_or_create_by(task_params[:group_attributes])
        byebug
        @tasklist_id = task_params[:tasklist_id].to_i
        byebug
        @task.group.tasklist = Tasklist.find_by(id: @tasklist_id)
        byebug
        if @task.valid?
            @task.save
            redirect_to task_path(@task)
        else
            render :new
        end
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
        params.require(:task).permit(:name, :due_date, :completed, :user_id, :tasklist_id, group_attributes: [:name, :description])
    end

    def tasklist_finder
        @tasklist = Tasklist.find_by_id(id: params[:task][:tasklist_id])
    end


    

end