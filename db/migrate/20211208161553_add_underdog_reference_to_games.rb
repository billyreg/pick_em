class AddUnderdogReferenceToGames < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :games, :teams, column: :underdog_id
    add_index :games, :underdog_id
    change_column_null :games, :underdog_id, false
  end
end
