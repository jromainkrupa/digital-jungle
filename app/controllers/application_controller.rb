class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_locale
    if user_signed_in?
      I18n.locale = current_user.language.to_sym
    else
      I18n.locale = params[:lang] || locale_from_header || I18n.default_locale
    end
  end

  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE','').scan(/[a-z]{2}/).first
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :is_entrepreneur, :language, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :is_entrepreneur, :language, :avatar])
  end

  def after_sign_in_path_for(resource) 
    if resource.is_entrepreneur?
      entrepreneur_projects_path
    else
      projects_path
    end
  end
end
