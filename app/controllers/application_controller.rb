require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize
    redirect_to '/login' unless logged?
  end
  helper_method :logged?
  def logged?
    session['logged'] == 'true'
  end
end
