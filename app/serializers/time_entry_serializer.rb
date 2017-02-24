class TimeEntrySerializer < ActiveModel::Serializer
  attributes  :time, :timecard_id
  belongs_to  :timecard
end
