class Schedule < ApplicationRecord
  belongs_to :school
  belongs_to :event
  belongs_to :room

  def self.display_schedule(day)
    time = Time.utc(2000,01,01,8,00)
    school_closed = Time.utc(2000,01,01,20,00)
    html = ''
    css_class = "table-info"
    until time == school_closed do
      html << "<td>#{time}</td>"
      Room.all.each do |room|
        schedule = room.schedules.where(start_time: time, day: day)[0]&.event
        if schedule
          html << "<td class = 'table-info'>#{schedule.name}</td>"
        else
          html << '<td></td>'
        end
      end
      html << '<tr>'
      time = time + 15.minutes
    end
    return html
  end
end
