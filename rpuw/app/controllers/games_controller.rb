class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @question = @game.questions.first
  end

  def create
    @game = Game.new
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

  def start
    @game = Game.find(params[:id])
    @question = @game.questions.first
    @game.update(status: "started", current_question_id: @question.id)
    

    Turbo::StreamsChannel.broadcast_update_to @game,
      target: "game_#{@game.id}", 
      partial: "games/question",
      locals: {
        game: @game,
        question: @question,
        participant: nil
      }
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
