class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(participant_ids: params.dig(:game, :participant_ids))
    @game.questions = Question.all.sample(3)
    @game.save
    redirect_to game_path(@game)
  end

  def answer
    @game = Game.find(params[:id])
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    @participant = User.find(params[:participant_id])

    if @answer.correct?
      # broadcast
    else
      # broadcast
    end
  end
end
