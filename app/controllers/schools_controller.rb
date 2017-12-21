class SchoolsController < ApplicationController
  before_action :authenticate_user!
  def show
    @school = School.find(params[:id])
  end
end
