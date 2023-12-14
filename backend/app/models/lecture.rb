class Lecture < ApplicationRecord
	has_many :schedules
	validates :day_of_week, :period, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 6 }
end
