class EventsController < ApplicationController
  def new
    @school = School.find(params[:school_id])
    @event = Event.new
  end

  def create
    @school = School.find(params[:school_id])
    @event = @school.events.create!(event_params)
    redirect_to school_event_path(@school, @event)
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:school_id, :name, :description, :event_type)
  end
end
