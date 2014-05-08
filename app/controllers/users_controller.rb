class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)
    if @user.valid?
      sign_in(@user)
#      @student_profile = @user.profile
      redirect_to_create_profile
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :password).
      merge(profile: user_profile)
  end

  def user_profile
    if profile_class_ok?
      profile = params[:user][:profile].constantize
      profile.new
    end
  end

  def profile_class_ok?
    %w(StudentProfile ParentProfile).include? params[:user][:profile]
  end

  def redirect_to_create_profile
    if @user[:profile_type] == 'StudentProfile'
      redirect_to edit_user_student_profile_path(@user, @user.profile)
    elsif @user[:profile_type] == 'ParentProfile'
      redirect_to edit_user_parent_profile_path(@user, @user.profile)
    else
      redirect_to root_path
    end
  end
end
