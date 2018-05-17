class Schedule < ApplicationRecord
  belongs_to :school
  belongs_to :event
  belongs_to :room

  def self.order_by_time
    order('start_time')
  end

  def self.display_schedule(date, school_id)
    school = School.find(school_id)
    school_open = Time.utc(2000,01,01,8,00)
    school_closed = Time.utc(2000,01,01,20,00)
    html = ''
    css_class = "table-info"
    last_display_date = date + 7.days
    until date == last_display_date do
      html << date.strftime('%A, %B %d, %Y')
      html << '<table class="table"><thead><tr><th>Time</th>'
      school.rooms.all.each do |room|
        html << "<th>#{room.name}</th>"
      end
      html << '</tr></thead><tbody>'
      time = school_open
      until time == school_closed do
        html << "<td>#{time.strftime('%l:%M%P')}</td>"
        school.rooms.all.each do |room|
          schedule = room.schedules.where(start_time: time, start_date: date)[0]
          if schedule
            check_time = time
            row_span = 0
            until check_time == schedule.end_time do
              row_span += 1
              check_time += 15.minutes
            end
            html << "<td class = 'table-info' rowspan = '#{row_span}'>#{schedule.event.name}, #{date.strftime('%m/%d/%Y')}<br>#{schedule.start_time.strftime('%l:%M%P')}-#{schedule.end_time.strftime('%l:%M%P')}</td>"
          else
            html << '<td></td>'
          end
        end
        html << '<tr>'
        time = time + 15.minutes
      end
      html << '</tbody></table>'
      date = date + 1.day
    end
    return html
  end
end
