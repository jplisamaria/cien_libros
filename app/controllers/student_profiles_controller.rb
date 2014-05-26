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
    @student = find_student_profile
    @readings = @student.readings
    unless @student.child_of?(current_profile)
      redirect_to parent_profile
    end
  end

  def edit
    @student = find_student_profile
    unless @student.child_of?(current_profile)
      redirect_to parent_profile
    end
  end

  def update
    student_profile = find_student_profile
    student_profile.update(student_profile_params)
    student_user = User.find_by(profile_id: student_profile.id)
    reset_password(student_user, params[:password])
    redirect_to parent_profile
  end

  def destroy
    student_profile = find_student_profile
    student_profile.destroy
    redirect_to parent_profile
  end

  private

  def find_student_profile
    StudentProfile.find(params[:id])
  end

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
