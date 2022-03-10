class Task < ApplicationRecord
    has_many :schedules
    validates :name_task, presence: true
end
