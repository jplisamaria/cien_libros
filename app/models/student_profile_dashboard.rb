class StudentProfileDashboard
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def initialize(current_profile)
    @current_profile = current_profile
  end
end
