class TasklistsController < ApplicationController
    # before action authenticate user
    def index

    end

    def show
        current_tasklist
    end

    def new
        @tasklist = Tasklist.new
    end

    def create
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
        params.require(:tasklist).permit(:title, :description)
    end

end
