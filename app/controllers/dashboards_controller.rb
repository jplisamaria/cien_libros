class DashboardsController < ApplicationController
  def show
    @count = current_user.books.count
  end
end
