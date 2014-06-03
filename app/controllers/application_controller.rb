class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_locale
  protect_from_forgery with: :exception
  include Monban::ControllerHelpers
  before_action :require_login

  def current_profile
    current_user.profile
  end
  helper_method :current_profile

  def require_parenthood
    unless parent_profile?
      redirect_to root_path
    end
  end
  helper_method :require_parenthood

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }
  end

  def parent_profile?
    current_profile.parent?
  end
end
