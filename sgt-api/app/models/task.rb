class Task < ApplicationRecord
    validates :name_task, presence: true
end
