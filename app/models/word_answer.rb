class WordAnswer < ApplicationRecord
  belongs_to :word

  validates :content, presence: true
  validates :correct, inclusion: {in: [true, false]}
end