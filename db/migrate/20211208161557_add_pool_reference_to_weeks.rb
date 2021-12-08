class AddPoolReferenceToWeeks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :weeks, :pools
    add_index :weeks, :pool_id
    change_column_null :weeks, :pool_id, false
  end
end
