class Membership < ApplicationRecord
  # Direct associations

  belongs_to :pool,
             counter_cache: true

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
