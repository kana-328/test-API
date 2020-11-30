class ApplicationController < ActionController::Base
  ActionController::HttpAuthentication::Basic::ControllerMethods
  ActionController::HttpAuthentication::Digest::ControllerMethods
  ActionController::HttpAuthentication::Token::ControllerMethods
  include SessionsHelper
  def index
  end
end
