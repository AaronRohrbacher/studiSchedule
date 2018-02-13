class Room < ApplicationRecord
  belongs_to :school
  has_many :schedules
  has_many :events, :through => :schedules

  def self.has_scheduling_conflict?(room_id, start_time, end_time)
    room = Room.find(room_id)
    conflict = nil
    room.schedules.each do |schedule|
      if start_time.between?(schedule.start_time, schedule.end_time - 1.second) || end_time.between?(schedule.start_time, schedule.end_time - 1.second) || schedule.start_time.between?(start_time, end_time - 1.second) || schedule.end_time.between?(start_time, end_time - 1.second)
        return true
      else
        conflict = false
      end
    end
    conflict
  end
end
