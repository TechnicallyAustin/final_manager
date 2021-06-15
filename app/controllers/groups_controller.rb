class GroupsController < ApplicationController
    before_action :authenticate_user!
    def index
        @groups = current_user.groups
    end

    def show
        group_finder
    end

    def edit
        group_finder
    end

    def update
        group_finder
        @group.update(group_params)
        if @group.valid?
            @group.save
            redirect_to group_path(@group)
        else
            render :edit
        end
    end

    def new
        @group = Group.new
    end

    def create 
        @group = Group.new(group_params)
        if @group.valid?
            @group.save
        else
            render 'task\new'
        end
    end

    private

    def group_finder
        @group = Group.find_by(id: params[:id])
    end

    def group_params
        params.require(:group).permit(:name, :description)
    end
end
