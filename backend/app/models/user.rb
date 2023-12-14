class User < ApplicationRecord
	has_many :schedules
	validates :password, :first_name, :last_name, presence: true
end
