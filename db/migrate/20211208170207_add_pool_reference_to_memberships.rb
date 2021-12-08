class AddPoolReferenceToMemberships < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :memberships, :pools
    add_index :memberships, :pool_id
    change_column_null :memberships, :pool_id, false
  end
end
