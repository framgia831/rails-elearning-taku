class ApplicationController < ActionController::Base
  include SessionHelper

  def require_login
    unless logged_in?
      flash[:danger] = "Plese log-in"
      redirect_to root_url
    end
  end
end
