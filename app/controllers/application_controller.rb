class ApplicationController < ActionController::Base
  include SessionHelper

  def require_login
    unless logged_in?
      store_location
      flash[:danger] = "Plese log-in."
      redirect_to root_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      flash[:danger] = "Have no authority."
      redirect_to root_url
    end
  end

  def require_admin
    unless logged_in? && current_user.admin?
      flash[:danger] = "Have no authority."
      redirect_to root_url
    end
  end
end
