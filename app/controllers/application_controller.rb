class ApplicationController < ActionController::Base

  def require_signin
    unless signed_in?
      session[:intended_url] = request.url
      redirect_to signin_url, notice: "Not logged in"
    end
  end

  def require_signout
    if signed_in?
      redirect_to user_url(current_user.another_id), notice: "Already logged in"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def signed_in?
    !current_user.nil?
  end
  helper_method :signed_in?

  def require_admin
    if !admin_user?
      redirect_to user_url(current_user.another_id), notice: "admin only"
    end
  end

  def admin_user?
    signed_in? && current_user.admin?
  end
  helper_method :admin_user?
end
