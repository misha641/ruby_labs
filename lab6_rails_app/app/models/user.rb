
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { user: 0, admin: 1 }

  has_many :medicines, dependent: :destroy

  validates :name, presence: true,
                   length: { minimum: 2, maximum: 50 }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }
end
