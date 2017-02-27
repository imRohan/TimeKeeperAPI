class TimeEntry < ApplicationRecord
  validates :time, :timecard_id, presence: true
  belongs_to :timecard
  before_create :check_if_timecard_complete

  private
  def check_if_timecard_complete
    my_timecard = Timecard.find(self.timecard_id)
    sibling_time_entries = my_timecard.time_entries
    if sibling_time_entries.length%2 == 1
      last_entry_time = sibling_time_entries.last.time.to_time
      my_time = self.time.to_time
      last_pair_time = ((my_time - last_entry_time)/60)/60
      my_timecard.total_hours += last_pair_time
      my_timecard.save
    end
  end
end
