class ParentProfilesController < ApplicationController
  skip_before_action :require_login

  def edit
    @user = User.find(params[:user_id])
    @parent_profile = find_parent_profile
  end

  def update
    parent_profile = find_parent_profile
    parent_profile.update(parent_profile_params)
    redirect_to root_path
  end

  def show
    @parent_profile = current_profile
    @children = find_children
  end

  private

  def parent_profile_params
    params.require(:parent_profile).permit(
      :first_name,
      :last_name)
  end

  def find_parent_profile
    #  check who current_user is
    ParentProfile.find(params[:id])
  end

  def find_children
    StudentProfile.where(parent_profile_id: @parent_profile.id)
  end
end
