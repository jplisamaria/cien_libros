class ParentProfilesController < ApplicationController
  skip_before_action :require_login
  before_action :require_parenthood, only: [
    :edit,
    :update,
    :show]
  before_action :require_profile_ownership, only: [
    :edit,
    :update,
    :show]

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
    @children = find_own_children
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

  def find_own_children
    StudentProfile.where(parent_profile_id: current_profile.id)
  end

  def require_profile_ownership
    unless parent_owns_profile?
      flash[:error] = 'This is not your profile.'
      redirect_to edit_user_parent_profile_path(current_user, current_profile)
    end
  end

  def parent_owns_profile?
    current_profile.id.to_s == params[:id]
  end
end
