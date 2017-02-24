class TimeEntry < ApplicationRecord
  validates :time, :timecard_id, presence: true
  belongs_to :timecard
end
