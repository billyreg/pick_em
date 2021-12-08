class WeekResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :pool_id, :integer

  # Direct associations

  belongs_to :pool

  has_many   :games

  # Indirect associations
end
