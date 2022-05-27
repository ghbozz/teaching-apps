class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :game_questions, dependent: :destroy
  has_many :games, through: :game_questions
  belongs_to :theme
end
