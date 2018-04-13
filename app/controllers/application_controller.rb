class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper CSSModules::ViewHelper
  
  include SessionsHelper
end
