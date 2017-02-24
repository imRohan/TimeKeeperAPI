class TimecardSerializer < ActiveModel::Serializer
  attributes :username, :occurrence, :total_hours
  has_many :time_entries
end
