class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private 

   helper_method :current_user

   helper_method :barber

  def current_user
    # @current_user ||= Customer.find(session[:customer_id]) if session[:customer_id]
    @current_user ||= Barber.find(session[:barber_id]) if session[:barber_id]
  end

  def barber
  @barber == [:is_barber]
  end

end