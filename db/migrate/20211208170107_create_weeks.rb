class CreateWeeks < ActiveRecord::Migration[6.0]
  def change
    create_table :weeks do |t|
      t.integer :pool_id
      t.string :name

      t.timestamps
    end
  end
end
