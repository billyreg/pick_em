class Pool < ApplicationRecord
  # Direct associations

  has_many   :memberships,
             dependent: :destroy

  has_many   :weeks,
             dependent: :destroy

  # Indirect associations

  has_many   :members,
             through: :memberships,
             source: :user

  # Validations

  # Scopes

  def to_s
    name
  end
end
