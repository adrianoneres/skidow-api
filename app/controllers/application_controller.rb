class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :verify_logged_in

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def verify_logged_in
    unless current_user
      redirect_to log_in_path, alert: 'You must log in first.'
    end
  end
end
