class StudentProfileDashboard
  extend ActiveModel::Naming
  GOAL = 100

  def initialize(current_profile)
    @current_profile = current_profile
  end
end
