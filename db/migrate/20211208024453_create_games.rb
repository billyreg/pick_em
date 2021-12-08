class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :favorite
      t.string :underdog
      t.string :description

      t.timestamps
    end
  end
end
