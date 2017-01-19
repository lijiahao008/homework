class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :log_out

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
    # debugger
  end

  def login_user!(user)
    # debugger
    session[:session_token] = user.reset_session_token!

    redirect_to cats_url
  end

  def log_out
    # debugger
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def redirect_if_signed_in
    unless current_user.nil?
      redirect_to cats_url
    end
  end

  def cat_owner
    unless Cat.find(params[:id]).user_id == current_user.id
      flash[:notice] = "you are not my owner, get lost"
      redirect_to cats_url
    end
  end


end
