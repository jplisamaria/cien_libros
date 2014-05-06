class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)
    @student_profile = @user.profile
    if @user[:profile_type] = 'StudentProfile'
      redirect_to edit_user_student_profile_path(
        @user, @student_profile)
    else
      redirect_to root_path
    end
  ## I'll need this later.
  #   if @user.valid?
  #     sign_in(@user)
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :password).
      merge(profile: user_profile)
  end

  def user_profile
    profile_class.new
  end

  def profile_class
    if valid_profile_class?
      params[:user][:profile].constantize
    else
      fail 'Choose a profile.'
    end
  end

  def valid_profile_class?
    %w(StudentProfile).include? params[:user][:profile]
  end
end
