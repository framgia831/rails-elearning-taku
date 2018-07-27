class LessonsController < ApplicationController
  def create
    lesson = current_user.lessons.build(category_id: params[:category_id])
    lesson.save

    category = lesson.category
    category.words.each do |word|
      lesson_word = lesson.lesson_words.build(word: word)
      lesson_word.save
    end

    lesson_word = LessonWord.first
    redirect_to [lesson, lesson_word]
  end

  def show
  end
end
