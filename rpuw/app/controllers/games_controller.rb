class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @question = @game.questions.first
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
    @next_question = @game.questions.where.not(id: @question.id).first

    if @answer.correct?
      render turbo_stream: turbo_stream.replace(:question, partial: "games/question", locals: { question: @next_question })
    end
  end
end
