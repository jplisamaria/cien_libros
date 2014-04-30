class HomesController < ApplicationController
  skip_before_action :require_login
  before_action :goto_dashboard, if: :signed_in?

  def show
  end

  private

  def goto_dashboard
    redirect_to dashboard_path
  end
end
