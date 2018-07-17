class Admin::CategoriesController < ApplicationController

  before_action :require_admin

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:sucess] = "Created!"
      redirect_to admin_category_url(@category)
    else
      render "new"
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Updated!"
      redirect_to admin_category_url(@category)
    else
      render "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = "Deleted!"
      redirect_to admin_categories_url
    end
  end

  private
    def category_params
      params.require(:category).permit(:title, :description)
    end
end
