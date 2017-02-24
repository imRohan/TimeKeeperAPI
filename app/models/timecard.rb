class Timecard < ApplicationRecord
  validates :username, :occurrence,  presence: true
end
