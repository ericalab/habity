class DailyAchievement < ApplicationRecord
  belongs_to :User
  belongs_to :DailyHabit
  
  #取ってくるデータのメソッド
  # def correct_habits

  # end
end
