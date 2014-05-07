class StudentProfileDashboard
  extend ActiveModel::Naming

  def initialize(current_profile)
    @current_profile = current_profile
  end
end
