class AddStatusToUserGames < ActiveRecord::Migration[7.0]
  def change
    add_column :user_games, :status, :string
  end
end
