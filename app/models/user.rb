class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { in: 8..32 },format: { with: /\A[A-Za-z]\w*\z/ }
  has_secure_password

  has_many :hobbies
  has_many :achievements
  has_many :daily_habits
  has_many :weekly_habits
  has_many :daily_achievements
  has_many :weekly_achievements
;end
