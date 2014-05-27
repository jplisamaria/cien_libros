class SearchesController < ApplicationController
  def new
    @teacher_profile = get_teacher_profile
  end

  private
  def get_teacher_profile
    binding.pry
    if current_user.profile_type == "TeacherProfile"
      current_profile
    end
  end
end
