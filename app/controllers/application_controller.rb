class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :check_admin, :check_teacher, :check_session

  def after_sign_in_path_for(resource)
    @school = School.find(resource.school.id)
    school_path(@school)
  end

  def check_user_school
    if current_user.school.id === params[:id].to_i
      return
    else
      sign_out_and_redirect(current_user)
      flash[:alert] = 'User not enrolled at this school.'
    end
  end

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

  def check_session
    if current_user
      return
    else
      redirect_to new_user_session_path
    end
  end

end
