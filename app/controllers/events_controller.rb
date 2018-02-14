class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, :except => [:show, :index]
  before_action :fetch_school, only: [:new, :create, :show]

  def index
    if current_user.account_admin
      @events = Event.all
    elsif current_user.account_type == Teacher
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

  # def edit
  #   @school = School.find(params[:school_id])
  #   @event = Event.find(params[:id])
  #   @teachers = Teacher.all
  #   @students = Student.all
  # end

  def update
    @school = School.find(params[:school_id])
    @event = Event.find(params[:id])
    @event.update!(event_params)
  end


  def show
    @event = Event.find(params[:id])
    @teachers = Teacher.all
  end

  private

  def fetch_school
    @school = School.find(params[:school_id])
    if @school.nil?

    end
  end

  def event_params
    params.require(:event).permit(:school_id, :name, :description, :event_type, :teacher_id)
  end
end
