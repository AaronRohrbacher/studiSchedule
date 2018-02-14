class EventTeachersController < ApplicationController
  before_action :authenticate_user!, :check_admin
  def new
    @school = School.find(params[:school_id])
    @event = Event.find(params[:event_id])
    @teachers = Teacher.all
    @teacher_event = EventTeacher.new
  end

  def create
    @event = Event.find(params[:event_id])
    @school = School.find(params[:school_id])
    EventTeacher.create!(school_id: @school.id, event_id: @event.id, teacher_id: params[:event_teacher][:teacher_id])
  end

  private

  def event_teacher_params
    params.require(:teacher_event).permit(:school_id, :event_id, :teacher_id)
  end
end
