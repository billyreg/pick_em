class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :pool_id
      t.integer :member_type

      t.timestamps
    end
  end
end
