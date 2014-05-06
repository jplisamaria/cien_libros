class DashboardsController < ApplicationController
  def show
    @dashboard = dashboard
#    @count = current_user.books.count
    
  end

  private

  def dashboard
    dashboard_class.new(current_profile)
  end

  def dashboard_class
    "#{current_profile.class}Dashboard".constantize
  end

end
