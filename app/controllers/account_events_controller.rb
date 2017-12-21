class AccountEventsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  before_action :check_admin
  def new
    @accounts = Account.all
    @school = School.find(params[:school_id])
    @event = Event.find(params[:event_id])
    @account_event = AccountEvent.new
  end

  def create
    @school = School.find(params[:school_id])
    @event = Event.find(params[:event_id])
    @account = Account.find(params[:account_event][:account_id])
    AccountEvent.create!(school_id: @school.id, event_id: @event.id, account_id: @account.id)
  end
end
