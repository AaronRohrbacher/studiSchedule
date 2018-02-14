class Teacher < Account
  has_many :event_teachers
  has_many :events, :through => :event_teachers
  has_many :timereports
end
