class ParentProfile < ActiveRecord::Base
  has_one :user, as: :profile, dependent: :destroy
  has_many :student_profiles

  def teacher?
    false
  end

  def student?
    false
  end

  def parent?
    true
  end

  def at_hernandez?
    self.student_profiles.pluck(:at_hernandez).include?(true)
  end
end
