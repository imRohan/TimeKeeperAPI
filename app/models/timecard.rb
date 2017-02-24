class Timecard < ApplicationRecord
  validates :username, :occurrence, presence: true
  validates :username, uniqueness: { scope: :occurrence }
end
