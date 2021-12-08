class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :user_name, :string
  attribute :user_type, :string_enum, allow: User.user_types.keys

  # Direct associations

  has_many   :memberships

  has_many   :picks

  # Indirect associations

  many_to_many :pools
end
