class Schedule < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :task, dependent: :destroy
end
