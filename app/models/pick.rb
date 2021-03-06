class Pick < ApplicationRecord
  # Direct associations

  belongs_to :team,
             counter_cache: true

  belongs_to :game

  belongs_to :user

  # Indirect associations

  has_one    :week,
             through: :game,
             source: :week

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
