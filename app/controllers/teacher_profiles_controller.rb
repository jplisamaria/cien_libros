class TeacherProfilesController < ApplicationController
  def show
    @teacher_profile = current_profile
    @teacher_student_relationship = TeacherStudentRelationship.new
    @students_by_teacher = students_by_teacher
  end

  private

  def students_by_teacher
    teacher_student_relationships.map do |relationship|
      find_student_profile(relationship.student_profile_id)
    end
  end

  def teacher_student_relationships
    current_profile.teacher_student_relationships
  end

  def find_student_profile(id)
    StudentProfile.find(id)
  end
end
