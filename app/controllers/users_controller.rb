class UsersController < ApplicationController
  
  before_action :require_login, only: [:edit, :update, :index]
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to E-Learning System!"
      redirect_to @user
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Successfully updated!"
      redirect_to @user
    else
      render "edit"
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
