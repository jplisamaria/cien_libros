class HomesController < ApplicationController
  skip_before_action :require_login
  before_action :goto_dashboard

  def show
  end

  private

  def goto_dashboard
    if signed_in? && current_user[:profile_type] == 'StudentProfile'
      redirect_to student_profile_dashboard_path
    end
  end

end
