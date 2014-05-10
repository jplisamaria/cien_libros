class StudentProfilesController < ApplicationController
  skip_before_action :require_login

  def create
    @student_user = sign_up(student_user_params)
    student_profile = find_student_profile
    student_profile.update(student_profile_params)
    redirect_to parent_profile
  end

  def edit
    @student_user = User.find(params[:user_id])
    @student_profile = find_student_profile
  end

  def update
    student_profile = find_student_profile
    student_profile.update(student_profile_params)
    redirect_to root_path
  end

  private

  def student_profile_params
    params.require(:student_profile).permit(
      :first_name,
      :last_name,
      :grade_last_year,
    ).merge(parent_profile_id: current_profile.id)
  end

  def student_user_params
    params.permit(:username, :password).merge(profile: student_user_profile)
  end

  def student_user_profile
    StudentProfile.new
  end

  def find_student_profile
    StudentProfile.find(@student_user.profile_id)
  end

  def parent_profile
#   check if current_user.profile = ParentProfile
    current_profile
  end

  def parent_user
#    check if current_user.profile = ParentProfile
    current_user
  end


end
