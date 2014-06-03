class TeacherStudentRelationshipsController < ApplicationController
  def new
    @grade_last_year = grade_last_year
    @students_by_grade = find_students_by_grade
    @teacher_profile = get_teacher_profile
    @teacher_student_relationship = TeacherStudentRelationship.new
  end

  def create
    params[:student_ids].each do |student_profile_id|
      TeacherStudentRelationship.create(
        teacher_profile_id: current_profile.id,
        student_profile_id: student_profile_id
      )
    end
    redirect_to current_profile
  end

  private

  def get_teacher_profile
    if current_user.profile_type == "TeacherProfile"
      current_profile
    end
  end

  def grade_last_year
    params[:teacher_student_relationship][:grade_last_year]
  end

  def find_students_by_grade
    StudentProfile.where(
      grade_last_year: grade_last_year,
      at_hernandez: true
    )
  end
end
