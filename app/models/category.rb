class Category < ApplicationRecord
  has_many :hobbies, dependent: :destroy
end
