class AddFavoriteReferenceToGames < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :games, :teams, column: :favorite_id
    add_index :games, :favorite_id
    change_column_null :games, :favorite_id, false
  end
end
