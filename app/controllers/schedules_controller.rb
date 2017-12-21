class SchedulesController < ApplicationController
  before_action :authenticate_user, :check_admin
  def new
    @school = School.find(params[:school_id])
    @rooms = Room.all
    @event = Event.find(params[:event_id])
    @schedule = Schedule.new
  end

  def create
    @school = School.find(params[:school_id])
    @event = Event.find(params[:event_id])

    Schedule.create!(school_id: @school.id, event_id: @event.id, room_id: params[:schedule][:room_id], day: params[:schedule][:day], start_time: params[:schedule][:start_time], end_time: params[:schedule][:end_time])
  end
end
