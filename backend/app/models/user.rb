class User < ApplicationRecord
	validates :password, :first_name, :last_name, presence: true
end
