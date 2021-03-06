class SchedulesController < ApplicationController
  before_action :authenticate_user!, :check_admin
  def new
    @school = School.find(params[:school_id])
    @rooms = @school.rooms
    @event = Event.find(params[:event_id])
    @schedule = Schedule.new
  end

  def create
    end_of_semester = Time.utc(2018, 8, 30)
    @school = School.find(params[:school_id])
    @event = @school.events.find(params[:event_id])
    start_time = Time.utc(2000,01,01,params[:schedule]['start_time(4i)'].to_i,
                 params[:schedule]['start_time(5i)'].to_i)
    end_time = Time.utc(2000,01,01,params[:schedule]['end_time(4i)'].to_i,
                 params[:schedule]['end_time(5i)'].to_i)

    if Room.has_scheduling_conflict?(params[:schedule][:room_id], params[:schedule][:start_date], start_time, end_time)
      flash[:alert] = "Schedule Conflict, Try again"
      redirect_to new_school_event_schedule_path(@school, @event)
    else
      recurring_date = Date.parse(params[:schedule][:start_date])
      if params[:schedule][:recurring] == 'semester'
        end_recurring_date = end_of_semester
      elsif params[:schedule][:recurring] == 'once'
        end_recurring_date = recurring_date
      elsif params[:schedule][:recurring] = 'indefinite'
        end_recurring_date = recurring_date + 1.year
      end

      until recurring_date > end_recurring_date do
        Schedule.create!(
          school_id: @school.id,
          event_id: @event.id,
          room_id: params[:schedule][:room_id],
          start_date: recurring_date,
          start_time: start_time,
          end_time: end_time,
          )
        recurring_date = recurring_date + 1.week
      end
      flash[:notice] = "Schedule added to event and room successfully."
      redirect_to school_event_path(@school, @event)
    end
  end

  def edit
    @school = School.find(params[:school_id])
    @event = Event.find(params[:event_id])
    @schedule = Schedule.find(params[:id])
    @rooms = @school.rooms
  end

  def update
    end_of_semester = Time.utc(2018, 3, 30)
    @school = School.find(params[:school_id])
    @event = @school.events.find(params[:event_id])
    start_time = Time.utc(2000,01,01,params[:schedule]['start_time(4i)'].to_i,
                 params[:schedule]['start_time(5i)'].to_i)
    end_time = Time.utc(2000,01,01,params[:schedule]['end_time(4i)'].to_i,
                 params[:schedule]['end_time(5i)'].to_i)

    if Room.has_scheduling_conflict?(params[:schedule][:room_id], params[:schedule][:start_date], start_time, end_time)
      flash[:alert] = "Schedule Conflict, Try again"
      redirect_to new_school_event_schedule_path(@school, @event)
    else
      recurring_date = Date.parse(params[:schedule][:start_date])
      if params[:schedule][:recurring] == 'semester'
        end_recurring_date = end_of_semester
      elsif params[:schedule][:recurring] == 'once'
        end_recurring_date = recurring_date
      elsif params[:schedule][:recurring] = 'indefinite'
        end_recurring_date = recurring_date + 1.year
      end
      schedule = Schedule.find(params[:id])
      original_schedule_date = schedule.start_date
      original_start_time = schedule.start_time
      original_end_time = schedule.end_time

      until recurring_date > end_recurring_date do
        schedule.update(
          school_id: @school.id,
          event_id: @event.id,
          room_id: params[:schedule][:room_id],
          start_date: recurring_date,
          start_time: start_time,
          end_time: end_time,
          )
        recurring_date = recurring_date + 1.week
        original_schedule_date = original_schedule_date + 1.week
        schedule = Schedule.where(
          school_id: @school.id,
          event_id: @event.id,
          room_id: params[:schedule][:room_id],
          start_date: original_schedule_date,
          start_time: original_start_time,
          end_time: original_end_time,
          )
      end
      flash[:notice] = "Schedule added to event and room successfully."
      redirect_to school_event_path(@school, @event)
    end
  end

  def destroy
    @school = School.find(params[:school_id])
    @event = Event.find(params[:event_id])
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "Schedule deleted permanently."
    redirect_to school_event_path(@school, @event)
  end

end
