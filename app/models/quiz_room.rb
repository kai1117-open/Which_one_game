class QuizRoom < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :quiz_room_associations
  has_many :quizzes, through: :quiz_room_associations
end
