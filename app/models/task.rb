class Task < ApplicationRecord
    belongs_to :user
    belongs_to :tasklist
    belongs_to :group, optional: true 
    accepts_nested_attributes_for :group

    validates :name, presence: true
    validates :due_date, presence: true
    #validates_format_of :due_date, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "Date must be in the following format: mm/dd/yyyy" 

    # Class Level AR scope method
    scope :this_week, -> {where(["due_date <= ?", 7.days.from_now])}
    scope :total_complete, -> {where(["completed = ?", true])}

    def in_the_future
        future_week = 7.days.from_now
    end

    def real_date
        @real_date = self.due_date
        @real_date.strftime("%m/%d/%y")
    end

    def done?
        if self.completed
            "Completed"
        else
            "Incomplete"
        end
    end
end
