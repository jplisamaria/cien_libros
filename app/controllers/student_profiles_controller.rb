class StudentProfilesController < ApplicationController
  before_action :require_parenthood

  def new
    @parent_profile = parent_profile
    @student_profile = new_student_profile
  end

  def create
    student_user = sign_up(student_user_params)
    student_profile = student_user.profile
    student_profile.update(student_profile_params)
    redirect_to parent_profile
  end

  def show
    @student = StudentProfile.find(params[:id])
    unless @student.child_of(current_profile)
      redirect_to parent_profile
    end
  end

  private

  def student_profile_params
    params.require(:student_profile).permit(
      :first_name,
      :last_name,
      :grade_last_year,
      :at_hernandez
    ).merge(parent_profile_id: parent_profile.id)
  end

  def student_user_params
    params.permit(:username, :password).merge(profile: new_student_profile)
  end

  def new_student_profile
    StudentProfile.new
  end

  def parent_profile
    current_profile
  end
end
