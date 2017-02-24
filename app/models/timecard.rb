class Timecard < ApplicationRecord
  validates :username, :occurrence, presence: true
  validates :username, uniqueness: { scope: :occurrence }

  has_many  :time_entries, dependent: :destroy
end
