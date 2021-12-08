class AddFavoriteGameCountToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :favorite_games_count, :integer
  end
end
