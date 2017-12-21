class HomeController < ApplicationController
  before_action :check_session

  def index
    @school = School.find(params[:school_id])
  end
end
