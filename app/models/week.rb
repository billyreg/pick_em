class Week < ApplicationRecord
  # Direct associations

  belongs_to :pool

  has_many   :games,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    pool.to_s
  end
end
