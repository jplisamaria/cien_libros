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

  private

  def parent_profile_params
    params.require(:parent_profile).permit(
      :first_name,
      :last_name)
  end

  def find_parent_profile
    ParentProfile.find(params[:id])
  end
end
