class AddUserReferenceToPicks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :picks, :users
    add_index :picks, :user_id
    change_column_null :picks, :user_id, false
  end
end
