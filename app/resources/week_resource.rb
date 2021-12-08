class WeekResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :pool_id, :integer
  attribute :name, :string

  # Direct associations

  belongs_to :pool

  has_many   :games

  # Indirect associations

  has_many :picks do
    assign_each do |week, picks|
      picks.select do |p|
        p.id.in?(week.picks.map(&:id))
      end
    end
  end
end
