class AddGameReferenceToPicks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :picks, :games
    add_index :picks, :game_id
    change_column_null :picks, :game_id, false
  end
end
