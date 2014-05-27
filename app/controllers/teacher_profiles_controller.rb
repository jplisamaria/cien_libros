class TeacherProfilesController < ApplicationController

  def show
    @teacher_profile = current_profile
  end
end
