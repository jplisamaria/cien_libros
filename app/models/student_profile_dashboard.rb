class StudentProfileDashboard
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  GOAL = 100

  def initialize(current_profile)
    @current_profile = current_profile
#    @readings_done = current_profile.readings.count
#    @readings_left = GOAL - @readings_done
  end

  def readings_left
    GOAL - self.readings_done
  end

  def readings_done
    @current_profile.readings.count
  end
end
