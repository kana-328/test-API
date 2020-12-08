class ApplicationController < ActionController::Base
  protect_from_forgery
  ActionController::HttpAuthentication::Basic::ControllerMethods
  ActionController::HttpAuthentication::Digest::ControllerMethods
  ActionController::HttpAuthentication::Token::ControllerMethods
  include SessionsHelper
  def index
  end
end
