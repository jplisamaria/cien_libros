class TeacherStudentRelationship < ActiveRecord::Base
  belongs_to :TeacherProfile
  belongs_to :StudentProfile
end
