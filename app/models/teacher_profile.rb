class TeacherProfile < ActiveRecord::Base
  has_one :user, as: :profile, dependent: :destroy

  has_many :teacher_student_relationships
  has_many :students, through: :teacher_student_relationships
end
