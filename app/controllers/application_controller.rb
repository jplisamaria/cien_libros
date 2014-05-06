class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Monban::ControllerHelpers
  before_action :require_login

  def current_profile
    current_user.profile
  end
end
