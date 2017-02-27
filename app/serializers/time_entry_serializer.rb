class TimeEntrySerializer < ActiveModel::Serializer
  attributes  :time, :timecard_id, :id
  belongs_to  :timecard
end
