class Schedule < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :task, dependent: :destroy

  validates :date, :user, :task, presence: true

  # private
  # def countSchedulebyDate(schedule)
  #   Schedule.where(id: 2).count
  # end
end
