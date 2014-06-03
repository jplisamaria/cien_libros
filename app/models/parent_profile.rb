class ParentProfile < ActiveRecord::Base
  has_one :user, as: :profile, dependent: :destroy

  def teacher?
    false
  end

  def student?
    false
  end

  def parent?
    true
  end
end
