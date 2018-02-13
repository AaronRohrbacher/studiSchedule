class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, :except => [:show, :index]
  before_action :fetch_school, only: [:new, :create, :show]

  def index
    if current_user.account_admin?
      @events = Event.all
    elsif current_user.account_is_teacher?
      @events = current_user.account.teacher.events.all
    else
      @events = current_user.account.events.all
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = @school.events.create!(event_params)
    Board.create!(event_id: @event.id)
    redirect_to school_event_path(@school, @event)
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def fetch_school
    @school = School.find(params[:school_id])
    if @school.nil?

    end
  end

  def event_params
    params.require(:event).permit(:school_id, :name, :description, :event_type)
  end
end
