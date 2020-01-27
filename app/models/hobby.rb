class Hobby < ApplicationRecord
  belongs_to :user
  belongs_to :category
end
