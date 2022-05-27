class Game < ApplicationRecord
  has_many :user_games, dependent: :destroy
  has_many :participants, through: :user_games, source: :user
  has_many :game_questions, dependent: :destroy
  has_many :questions, through: :game_questions
end
