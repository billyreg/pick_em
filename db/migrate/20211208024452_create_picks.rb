class CreatePicks < ActiveRecord::Migration[6.0]
  def change
    create_table :picks do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :team
      t.integer :weight

      t.timestamps
    end
  end
end
