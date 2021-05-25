class Task < ApplicationRecord
    belongs_to :user
    belongs_to :tasklist
    belongs_to :group
    accepts_nested_attributes_for :group

    validates :name, presence: true
    validates :due_date, presence: true#, Make sure the due date is in the future.

end
