class SchoolsController < ApplicationController
  before_action :authenticate_user!, :check_user_school
  def show
    @school = School.find(params[:school_id])
  end
end
