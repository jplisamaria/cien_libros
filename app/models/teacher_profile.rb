class TeacherProfile < ActiveRecord::Base
  has_one :user, as: :profile, dependent: :destroy

  has_many :teacher_student_relationships
  has_many :students, through: :teacher_student_relationships

  def teacher?
    true
  end

  def student?
    false
  end

  def parent?
    false
  end
end
