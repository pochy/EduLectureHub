class User < ApplicationRecord
  has_many :schedules ,class_name: 'Schedule',foreign_key: 'lecture_id'
  has_many :lectures, foreign_key: 'instructor_id'

  has_secure_password

	validates :password, length: { minimum: 6 }, allow_nil: true
  validates :first_name, :last_name, presence: true

  def full_name
    "#{last_name} #{first_name}"
  end
end
