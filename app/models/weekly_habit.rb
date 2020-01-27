class WeeklyHabit < ApplicationRecord
    validates :name, presence: true
    has_many :weekly_achievements, dependent: :destroy

end
