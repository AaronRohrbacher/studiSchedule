class Student < Account
  belongs_to :school
  has_many :event_students
  has_many :events, :through => :event_students

end
