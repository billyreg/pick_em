class Membership < ApplicationRecord
  enum member_type: { "commissioner" => 0, "member" => 1 }

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
