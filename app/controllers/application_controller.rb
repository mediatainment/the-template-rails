class ApplicationController < ActionController::Base
  protect_from_forgery

  check_authorization :unless => :devise_controller?

  # catch cancancan access denied
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_back_or_default
  end

  before_filter :set_locale

  private

  # sets the default locales
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale
  end

  # redirects back or to root
  def redirect_back_or_default(default = root_path, *options)
    tag_options = {}
    options.first.each { |k,v| tag_options[k] = v } unless options.empty?
    redirect_to (request.referer.present? ? :back : default), tag_options
  end
end
