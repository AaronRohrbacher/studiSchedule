class EventsController < ApplicationController
  def new
    @school = School.find(params[:school_id])
    @event = Event.new
  end

  def create
    @school = School.find(params[:school_id])
    @school.events.create!(event_params)
  end

  private

  def event_params
    params.require(:event).permit(:school_id, :name, :description)
  end
end
