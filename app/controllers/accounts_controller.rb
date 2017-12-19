class AccountsController < ApplicationController
  def edit
    @school = School.find(params[:school_id])
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    @account.update!(account_params)

    if params[:account][:is_teacher] && @account.is_teacher === true
      @teacher = Teacher.create!(first_name: @account.first_name, last_name: @account.last_name, school_id: @account.school_id)
      TeacherAccount.create!(account_id: @account.id, teacher_id: @teacher.id)
    end
  end

private
  def account_params
    params.require(:account).permit(:first_name, :last_name, :is_teacher) ## Rails 4 strong params usage
  end
end
