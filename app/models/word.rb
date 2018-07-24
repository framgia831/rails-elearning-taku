class Word < ApplicationRecord
  belongs_to :category
  has_many :word_answers, dependent: :destroy
  accepts_nested_attributes_for :word_answers

  validates :content, presence: true

  def correct_answer
    word_answers.each do |answer|
      if answer.correct?
        return answer
      end
    end
  end
end
