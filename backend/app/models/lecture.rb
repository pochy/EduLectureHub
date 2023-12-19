class Lecture < ApplicationRecord
	belongs_to  :teacher ,class_name: 'User',foreign_key: 'instructor_id'
	has_many :schedules
	validates :day_of_week, :period, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 6 }

	scope :filter_dow_by, -> (dow) { where(day_of_week: dow) if dow.present? }
	scope :filter_period_by, -> (period) { where(period: period) if period.present? }
	scope :filter_title_by, -> (title) { where(title: title) if title.present? }
end
