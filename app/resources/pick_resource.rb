class PickResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :game_id, :integer
  attribute :team, :string
  attribute :weight, :integer

  # Direct associations

  belongs_to :game

  belongs_to :user

  # Indirect associations

end