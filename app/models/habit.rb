class Habit < ApplicationRecord
  validates :user_id, presence: true
  validates :daily, presence: true
  validates :weekly , presence: true
  validates :daily_total , presence: true
  validates :weekly_total , presence: true
  
  belongs_to :user
end
