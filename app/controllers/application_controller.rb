class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
skip_before_action :verify_authenticity_token
  private 

   helper_method :current_barber
   helper_method :current_user
   helper_method :barber

  def current_barber
      #@current_user ||= Customer.where(:id => session[:customer_id]).first
      @current_barber ||= Barber.where(:id => session[:barber_id]).first
  end
  def current_user
    @current_user ||= Customer.where(:id => session[:customer_id]).first
  end

  def barber
  @barber == [:is_barber]
  end

 

end