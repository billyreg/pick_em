class Team < ApplicationRecord
  # Direct associations

  has_many   :picks,
             dependent: :destroy

  has_many   :underdog_games,
             class_name: "Game",
             foreign_key: "underdog_id",
             dependent: :destroy

  has_many   :favorite_games,
             class_name: "Game",
             foreign_key: "favorite_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
