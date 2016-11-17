class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :verify_logged_in
  helper_method :authenticate

  @api_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def verify_logged_in
    unless current_user
      redirect_to log_in_path, alert: 'You must log in first.'
    end
  end

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @api_user = User.find_by(auth_token: token)
    end
  end
end
