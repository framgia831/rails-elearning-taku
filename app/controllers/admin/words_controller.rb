class Admin::WordsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @word = Word.new
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)
    if @word.save
      flash[:success] = "Added!"
      redirect_to [:admin, @category]
    else
      render "new"
    end
  end

  def destroy
    @word = Word.find_by(id: params[:id])
    if @word.destroy
      flash[:success] = "Deleted!"
      redirect_to [:admin, @word.category]
    end
  end

  private
    def word_params
      params.require(:word).permit(:content)
    end
end
