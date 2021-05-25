class Group < ApplicationRecord
# Associations
belongs_to :tasklist
has_many :tasks
# Validaitons
# Do i allow tasks to be created with or without a group?

end
