class StudentProfileDashboardsController < ApplicationController
  def show
    @readings_done = current_profile.readings.count
    @readings_left = StudentProfileDashboard::GOAL - @readings_done
  end
end
