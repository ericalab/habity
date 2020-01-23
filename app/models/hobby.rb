class Hobby < ApplicationRecord
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :title, presence: true
  validates :impression, presence: true
  belongs_to :category

  belongs_to :user
end
