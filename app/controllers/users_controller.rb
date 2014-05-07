class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)
    if @user.valid?
      @student_profile = @user.profile
      redirect_to_profile
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
    profile_class
  end

  def profile_class
    if profile_class_ok?
      profile = params[:user][:profile].constantize
      profile.new
    end
  end

  def profile_class_ok?
    %w(StudentProfile).include? params[:user][:profile]
  end

  def redirect_to_profile
    if @user[:profile_type] == 'StudentProfile'
      redirect_to edit_user_student_profile_path(@user, @student_profile)
    else
      redirect_to root_path
    end
  end
end
