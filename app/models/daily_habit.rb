class DailyHabit < ApplicationRecord
  validates :user_id, presence: true
  validates :daily_or_weekly, presence: true
  validates :daily_total , presence: true, on: :update
  validates :weekly_total , presence: true, on: :update
  
  belongs_to :user
  has_many :achievements
  
  #今日成功したか確認→返すメソッド
  def achieve_today?
    Habit.where(created_at: search_date.in_time_zone.all_day)
  end
  
  private
    def daily_or_weekly
      daily.presence or weekly.presence
    end  
end
