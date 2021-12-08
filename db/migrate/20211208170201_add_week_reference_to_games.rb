class AddWeekReferenceToGames < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :games, :weeks
    add_index :games, :week_id
    change_column_null :games, :week_id, false
  end
end
