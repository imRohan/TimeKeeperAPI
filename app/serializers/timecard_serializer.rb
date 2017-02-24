class TimecardSerializer < ActiveModel::Serializer
  attributes :username, :occurrence, :total_hours
end
