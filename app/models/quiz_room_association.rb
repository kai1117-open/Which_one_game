class QuizRoomAssociation < ApplicationRecord
  belongs_to :quiz_room
  belongs_to :quiz
  belongs_to :user
end
