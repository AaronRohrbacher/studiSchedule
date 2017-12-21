class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :check_admin, :check_teacher

  def check_admin
    if current_user && current_user.account.admin === true
      return
    else
      flash[:alert] = 'Admin only access'
      redirect_to root_path
    end
  end

  def check_teacher
    if current_user && current_user.account.teacher === true
      return
    else
      flash[:alert] = 'Teacher access only'
      redirect_to root_path
    end
  end

end
