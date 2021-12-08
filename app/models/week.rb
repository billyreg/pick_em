class Week < ApplicationRecord
  # Direct associations

  belongs_to :pool

  has_many   :games,
             dependent: :destroy

  # Indirect associations

  has_many   :picks,
             through: :games,
             source: :picks

  # Validations

  # Scopes

  def to_s
    name
  end
end
