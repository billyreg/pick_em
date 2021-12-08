class AddTeamReferenceToPicks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :picks, :teams
    add_index :picks, :team_id
    change_column_null :picks, :team_id, false
  end
end
