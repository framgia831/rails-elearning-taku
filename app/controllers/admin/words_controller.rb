class Admin::WordsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @word = Word.new
    3.times { @word.word_answers.build }
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

  def edit
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
    if @word.update_attributes(word_params)
      flash[:success] = "Updated!"
      redirect_to [:admin, @category]
    else
      render "edit"
    end
  end

  private
    def word_params
      params.require(:word).permit(
        :content,
        word_answers_attributes: [:id, :content, :correct]
      )
    end
end
