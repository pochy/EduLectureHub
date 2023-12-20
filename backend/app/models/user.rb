class User < ApplicationRecord
            # Include default devise modules.
            devise :database_authenticatable, :registerable,
                    :recoverable, :rememberable, :trackable, :validatable
                    #:confirmable, :omniauthable
            include DeviseTokenAuth::Concerns::User
  has_many :schedules ,class_name: 'Schedule',foreign_key: 'lecture_id'
  has_many :lectures, foreign_key: 'instructor_id'

  # validates :first_name, :last_name, presence: true

  def full_name
    "#{last_name} #{first_name}"
  end
end
