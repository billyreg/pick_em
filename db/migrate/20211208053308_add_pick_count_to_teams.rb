class AddPickCountToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :picks_count, :integer
  end
end
