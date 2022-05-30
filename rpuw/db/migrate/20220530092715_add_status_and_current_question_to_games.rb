class AddStatusAndCurrentQuestionToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :status, :string, default: "lobby"
    add_column :games, :current_question_id, :integer
  end
end
