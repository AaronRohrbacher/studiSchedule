class SchedulesController < ApplicationController
  before_action :authenticate_user!, :check_admin
  def new
    @school = School.find(params[:school_id])
    @rooms = Room.all
    @event = Event.find(params[:event_id])
    @schedule = Schedule.new
  end

  def create
    end_of_semester = Time.utc(2018, 3, 30)
    @school = School.find(params[:school_id])
    @event = Event.find(params[:event_id])
    start_time = Time.utc(2000,01,01,params[:schedule]['start_time(4i)'].to_i, params[:schedule]['start_time(5i)'].to_i)
    end_time = Time.utc(2000,01,01,params[:schedule]['end_time(4i)'].to_i, params[:schedule]['end_time(5i)'].to_i)

    # start_time = params[:schedule][:start_time].to_time
    # end_time = params[:schedule][:end_time].to_time


    if Room.has_scheduling_conflict?(params[:schedule][:room_id], start_time, end_time)
      flash[:alert] = "Schedule Conflict"
    else
      recurring_date = Date.parse(params[:schedule][:date])
      if params[:schedule][:recurring] == 'semester'
        until recurring_date >= end_of_semester do
          Schedule.create!(school_id: @school.id, event_id: @event.id, room_id: params[:schedule][:room_id], date: recurring_date, start_time: start_time, end_time: end_time, date: recurring_date)
          recurring_date = recurring_date + 1.week
        end
      end
    end
  end

  def index
    # @school = School.find(params[:school_id])
    @rooms = Room.all
    @events = Event.all
    @schedules = Schedule.all
  end
end
