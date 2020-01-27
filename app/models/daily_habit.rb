class DailyHabit < ApplicationRecord
  validates :name, presence: true
  has_many :daily_achievements, dependent: :destroy
end
