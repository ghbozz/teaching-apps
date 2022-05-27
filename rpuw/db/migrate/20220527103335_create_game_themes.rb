class CreateGameThemes < ActiveRecord::Migration[7.0]
  def change
    create_table :game_themes do |t|
      t.references :game, null: false, foreign_key: true
      t.references :theme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
