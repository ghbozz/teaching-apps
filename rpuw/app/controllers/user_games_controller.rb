class UserGamesController < ApplicationController
  def ready
    @user_game = UserGame.find(params[:id])
    @user_game.update(status: "ready")
    @game = @user_game.game

    Turbo::StreamsChannel.broadcast_update_to @game,
      target: "players",
      partial: "games/players",
      locals: {
        participations: @game.user_games,
      }
  end
end
