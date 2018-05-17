class EventStudentsController < ApplicationController
  before_action :authenticate_user!, :check_admin
  def new
    @school = School.find(params[:school_id])
    @event = Event.find(params[:event_id])
    @students = @school.students.all
    @event_students = EventStudent.new
  end

  def create
    @event = Event.find(params[:event_id])
    @school = School.find(params[:school_id])
    EventStudent.create!(school_id: @school.id, event_id: @event.id, student_id: params[:event_student][:student_id])
    flash[:notice] = "Student added to event successfully."
    redirect_to school_event_path(@school, @event)
  end

  private

  def event_student_params
    params.require(:event_student).permit(:school_id, :event_id, :student_id)
  end
end
