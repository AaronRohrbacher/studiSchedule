class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :check_admin
  
  def check_admin
    if current_user && current_user.account.admin === true
      return
    else
      flash[:alert] = 'Admin only access'
      redirect_to new_user_session_path
    end
  end
end
