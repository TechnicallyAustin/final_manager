class Tasklist < ApplicationRecord
# Associations
    has_many :tasks
    has_many :groups, through: :tasks
    belongs_to :user
# Validations

# Methods
    def add_task(task)
        # Adds a task to a selected task list
        current_tasklist.tasks << task
    end

end
