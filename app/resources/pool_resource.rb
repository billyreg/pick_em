class PoolResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string

  # Direct associations

  has_many   :memberships

  has_many   :weeks

  # Indirect associations

  many_to_many :members,
               resource: UserResource
end
