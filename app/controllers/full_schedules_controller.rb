class FullSchedulesController < ApplicationController
  def index
    @school = School.find(params[:school_id])
    if params[:start_date]
      @html = Schedule.display_schedule(params[:start_date][0].to_date.in_time_zone("Pacific Time (US & Canada)"), @school.id)
    else
      @html = Schedule.display_schedule(Time.now.in_time_zone("Pacific Time (US & Canada)"), @school.id)
    end
    params.delete :start_date
  end
end
