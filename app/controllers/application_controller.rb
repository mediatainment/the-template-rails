class ApplicationController < ActionController::Base
  protect_from_forgery

  check_authorization :unless => :devise_controller?


  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    if current_user
      redirect_to :back
    elsif redirect_to :root
    end
  end

end
