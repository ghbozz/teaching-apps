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
    @next_question = @game.next_question(@question)

    if @answer.correct?
      broadcast_next_question unless @game.last_question?(@question)
    end
  end

  private 

  def broadcast_next_question
    Turbo::StreamsChannel.broadcast_update_to @game, 
      target: "game_#{@game.id}", 
      partial: "games/question", 
      locals: { 
        game: @game, 
        question: @next_question,
        participant: @participant
      }
  end
end
