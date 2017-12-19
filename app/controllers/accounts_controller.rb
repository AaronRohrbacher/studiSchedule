class AccountsController < ApplicationController
  def edit
    @school = School.find(params[:school_id])
    @account = Account.find(params[:id])
  end

  def update

    @account = Account.find(params[:id])
    @account.update!(account_params)
  end

private
  def account_params
    params.require(:account).permit(:first_name, :last_name) ## Rails 4 strong params usage
  end
end
