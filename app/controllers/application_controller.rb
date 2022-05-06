class ApplicationController < ActionController::Base

  def require_signin
    unless signed_in?
      session[:intended_url] = request.url
      redirect_to signin_url
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def signed_in?
    !current_user.nil?
  end

  def require_admin
    if current_user.audience?
      redirect_to user_url(current_user), notice: "admin only"
    end
  end
end
