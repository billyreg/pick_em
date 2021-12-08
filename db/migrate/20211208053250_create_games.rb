class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :favorite_id
      t.integer :underdog_id
      t.string :description
      t.integer :week_id

      t.timestamps
    end
  end
end
