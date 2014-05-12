class StudentProfilesController < ApplicationController
  before_action :require_parenthood

  def new
    @parent_profile = current_profile
    @student_profile = StudentProfile.new
  end

  def create
    student_user = sign_up(student_user_params)
    student_profile = student_user.profile
    student_profile.update(student_profile_params)
    redirect_to parent_profile
  end

  def show
    if your_child?
      @student = StudentProfile.find(params[:id])
    else
      redirect_to root_path
    end
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
    params.permit(:username, :password).merge(profile: new_student_profile)
  end

  def new_student_profile
    StudentProfile.new
  end

  def parent_profile
    current_profile
  end

  def parent_user
    current_user
  end

  def your_child?
    student = StudentProfile.find(params[:id])
    current_profile.id == student.parent_profile_id
  end
end
