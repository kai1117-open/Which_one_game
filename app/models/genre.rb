class Genre < ApplicationRecord
  has_many :quizzes
  validates :genre_name, presence: true
  validates :introduction, length: { maximum: 500 }, allow_blank: true
end
