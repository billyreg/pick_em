class GameResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :favorite_id, :integer
  attribute :underdog_id, :integer
  attribute :description, :string
  attribute :week_id, :integer

  # Direct associations

  belongs_to :underdog,
             resource: TeamResource

  belongs_to :favorite,
             resource: TeamResource

  belongs_to :week

  has_many   :picks

  # Indirect associations
end
