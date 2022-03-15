class Schedule < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :task, dependent: :destroy
  # before_save :validate_task

  validates :date, :user, :task, presence: true
  validates :task, uniqueness: true

  # def validate_task
  #   byebug    
  # end
end
