class TimecardSerializer < ActiveModel::Serializer
  attributes :username, :occurrence, :total_hours, :id
  has_many :time_entries
end
