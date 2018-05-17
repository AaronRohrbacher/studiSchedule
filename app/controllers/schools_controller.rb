class SchoolsController < ApplicationController
  before_action :authenticate_user!, :check_user_school
  def show
    @school = School.find(params[:school_id])
    if !current_user.account.admin
      @events = current_user.account.events.all
    end
  end
end
