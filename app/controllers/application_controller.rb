class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Monban::ControllerHelpers
  before_action :require_login

  def current_profile
    current_user.profile
  end
  helper_method :current_profile

  def require_parenthood
    unless parent_profile?
      flash[:error] = "You must be a parent to access this section."
      redirect_to root_path
    end
  end
  helper_method :require_parenthood

  private

  def parent_profile?
    current_profile.class.to_s == "ParentProfile"
  end
end
