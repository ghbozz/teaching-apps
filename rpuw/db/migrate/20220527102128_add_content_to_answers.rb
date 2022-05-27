class AddContentToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :content, :text
  end
end
