class Tasklist < ApplicationRecord
# Associations
    has_many :tasks
    has_many :groups, through: :tasks
    belongs_to :user
# Validations

# Methods
    def add_task(task_name)
        # Adds a task to a selected task list
        @task = Task.find_or_create_by(task_name)
        self.tasks << @task
    end

end
