class Tasklist < ApplicationRecord
# Associations
has_many :tasks
has_many :groups, through: :tasks
belongs_to :user

end
