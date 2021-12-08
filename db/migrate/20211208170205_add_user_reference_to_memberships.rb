class AddUserReferenceToMemberships < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :memberships, :users
    add_index :memberships, :user_id
    change_column_null :memberships, :user_id, false
  end
end
