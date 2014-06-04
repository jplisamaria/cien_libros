class TeacherStudentRelationship < ActiveRecord::Base
  belongs_to :teacher_profile
  belongs_to :student_profile

  attr_accessor :grade_last_year
end
