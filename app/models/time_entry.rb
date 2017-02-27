class TimeEntry < ApplicationRecord
  validates :time, :timecard_id, presence: true
  belongs_to :timecard
  before_create :check_if_timecard_complete
  after_update :update_hours_worked
  after_destroy :update_hours_worked

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

  def update_hours_worked
    my_timecard = Timecard.find(self.timecard_id)
    sibling_time_entries = my_timecard.time_entries
    total_hours = 0.0
    sibling_time_entries.each_with_index do |entry, index|
      index_fix = index + 1
      if index_fix%2 == 0
        last_entry_time = sibling_time_entries[index - 1].time.to_time
        entry_time = entry.time.to_time
        pair_total = ((entry_time - last_entry_time)/60)/60
        total_hours += pair_total
      end
    end
    my_timecard.total_hours = total_hours
    my_timecard.save
  end
end
