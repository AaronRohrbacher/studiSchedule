class SchedulesController < ApplicationController
  def new
    @school = School.find(params[:school_id])
    @event = Event.find(params[:event_id])
    @schedule = Schedule.new
  end

  def create
    @school = School.find(params[:school_id])
    @event = Event.find(params[:event_id])

    Schedule.create!(school_id: @school.id, event_id: @event.id)
  end
end
