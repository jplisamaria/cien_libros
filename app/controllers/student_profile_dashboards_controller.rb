class StudentProfileDashboardsController < ApplicationController
  def show
    @count = current_profile.readings.count
  end
end
