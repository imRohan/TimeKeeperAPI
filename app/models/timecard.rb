class Timecard < ApplicationRecord
  validates :username, :occurrence, presence: true
  validates :username, uniqueness: { scope: :occurrence }

  has_many  :time_entries, dependent: :destroy

  before_create :normalize_params

  private

  def normalize_params
    self.username.downcase!
  end
end
