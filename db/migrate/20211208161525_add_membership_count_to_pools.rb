class AddMembershipCountToPools < ActiveRecord::Migration[6.0]
  def change
    add_column :pools, :memberships_count, :integer
  end
end
