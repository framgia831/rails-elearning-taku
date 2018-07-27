class LessonsController < ApplicationController
  def create
    lesson = current_user.lessons.build(category_id: params[:category_id])
    lesson.save

    category = lesson.category
    category.words.each do |word|
      lesson_word = lesson.lesson_words.build(word: word)
      lesson_word.save
    end

    redirect_to [lesson, lesson.lesson_words.first]
  end

  def show
    @lesson = Lesson.find(params[:id])
    @lesson_words = @lesson.lesson_words
  end
end
