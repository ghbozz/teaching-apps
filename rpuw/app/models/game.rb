class Game < ApplicationRecord
  has_many :user_games, dependent: :destroy
  has_many :participants, through: :user_games, source: :user
  has_many :game_questions, dependent: :destroy
  has_many :questions, through: :game_questions

  def next_question(question)
    questions[questions.index(question) + 1]
  end

  def last_question?(question)
    questions.last == question
  end

  def lobby?
    status == "lobby"
  end
end
