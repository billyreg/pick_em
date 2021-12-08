class GameResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :favorite, :string
  attribute :underdog, :string
  attribute :description, :string

  # Direct associations

  has_many :picks

  # Indirect associations
end
