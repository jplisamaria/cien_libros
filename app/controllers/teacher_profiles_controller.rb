class TeacherProfilesController < ApplicationController
  def show
    @teacher_profile = current_profile
    @teacher_student_relationship = TeacherStudentRelationship.new
    @students_by_teacher = students_by_teacher
  end

  private

  def students_by_teacher
    student_list = []
    teacher_student_relationships.each do |relationship|
      student_list << find_student_profile(relationship.student_profile_id)
    end
    student_list
  end

  def teacher_student_relationships
    TeacherStudentRelationship.where(teacher_profile_id: current_profile.id)
  end

  def find_student_profile(id)
    StudentProfile.find(id)
  end
end
