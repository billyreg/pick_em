class AddUnderdogGameCountToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :underdog_games_count, :integer
  end
end
