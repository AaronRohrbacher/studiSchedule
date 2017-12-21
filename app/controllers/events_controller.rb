class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, :except => [:show, :index]

  def index
    if current_user.account.admin === true
      @events = Event.all
    elsif current_user.account.is_teacher === true
      @events = current_user.account.teacher.events.all
    else
      @events = current_user.account.events.all
    end
  end

  def new
    @school = School.find(params[:school_id])
    @event = Event.new
  end

  def create
    @school = School.find(params[:school_id])
    @event = @school.events.create!(event_params)
    Board.create!(event_id: @event.id)
    redirect_to school_event_path(@school, @event)
  end

  def show
    @school = School.find(params[:school_id])
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:school_id, :name, :description, :event_type)
  end
end
