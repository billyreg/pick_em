class MembershipResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :pool_id, :integer

  # Direct associations

  belongs_to :pool

  belongs_to :user

  # Indirect associations
end
