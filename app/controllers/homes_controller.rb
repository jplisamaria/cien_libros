class HomesController < ApplicationController
  skip_before_action :require_login
  before_action :goto_dashboard

  def show
  end

  private

  def goto_dashboard
    if signed_in?
      redirect_to [current_user.profile, :dashboard]
    end
  end
end
