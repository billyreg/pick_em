class Game < ApplicationRecord
  # Direct associations

  belongs_to :underdog,
             class_name: "Team",
             counter_cache: :underdog_games_count

  belongs_to :favorite,
             class_name: "Team",
             counter_cache: :favorite_games_count

  belongs_to :week

  has_many   :picks,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    description
  end
end
