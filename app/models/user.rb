class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :memberships,
             dependent: :destroy

  has_many   :picks,
             dependent: :destroy

  # Indirect associations

  has_many   :pools,
             through: :memberships,
             source: :pool

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
