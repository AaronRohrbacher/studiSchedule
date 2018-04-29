class StudentsController < ApplicationController
  before_action :authenticate_user!
  # before_action :check_admin
  def edit
    @school = School.find(params[:school_id])
    @account = Student.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    @account.update(account_params)
    sign_out_and_redirect(current_user)
  end

private
  def account_params
    params.require(:student).permit(:first_name, :last_name, :is_teacher)
  end
end
