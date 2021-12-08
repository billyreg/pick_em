class Game < ApplicationRecord
  # Direct associations

  has_many   :picks,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    favorite
  end
end
