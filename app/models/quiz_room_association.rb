class QuizRoomAssociation < ApplicationRecord
  belongs_to :quiz_room
  belongs_to :quiz, optional: true # ここを追加
  belongs_to :user
end
