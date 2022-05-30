class AddQuestionNumberToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :question_number, :integer, default: 0
  end
end
