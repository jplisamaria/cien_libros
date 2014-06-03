class TeacherStudentRelationship < ActiveRecord::Base
  belongs_to :TeacherProfile
  belongs_to :StudentProfile

  attr_accessor :grade_last_year
end
