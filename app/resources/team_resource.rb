class TeamResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string

  # Direct associations

  has_many   :picks

  has_many   :underdog_games,
             resource: GameResource,
             foreign_key: :underdog_id

  has_many   :favorite_games,
             resource: GameResource,
             foreign_key: :favorite_id

  # Indirect associations
end
