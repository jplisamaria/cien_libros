class ChildrenController < ApplicationController
  skip_before_action :require_login

  def new
    @parent_profile = current_profile
    @student_profile = StudentProfile.new
  end

  def create
    # @user = sign_up(user_params)
    # if @user.valid?
    #   sign_in(@user)
    #   redirect_to_create_profile
    # else
    #   render :new
    # end
  end

  # private

  # def user_params
  #   params.require(:user).permit(
  #     :username,
  #     :password).
  #     merge(profile: user_profile)
  # end

  # def user_profile
  #   if profile_class_ok?
  #     profile = params[:user][:profile].constantize
  #     profile.new
  #   end
  # end

  # def profile_class_ok?
  #   %w(StudentProfile ParentProfile).include? params[:user][:profile]
  # end

  # def redirect_to_create_profile
  #   redirect_to [:edit, @user, @user.profile]
  # end
end
