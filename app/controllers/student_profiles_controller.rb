class StudentProfilesController < ApplicationController
  skip_before_action :require_login

  def edit
    @user = User.find(params[:user_id])
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
      :grade_last_year
    )
  end

  def find_student_profile
    StudentProfile.find(params[:id])
  end
end
