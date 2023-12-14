class User < ApplicationRecord
  has_many :schedules

  has_secure_password

	validates :password, length: { minimum: 6 }, allow_nil: true
  validates :first_name, :last_name, presence: true
end
