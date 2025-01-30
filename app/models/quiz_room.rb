class QuizRoom < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  belongs_to :questioner, class_name: "User", foreign_key: "questioner_id", optional: true
  belongs_to :quiz, optional: true

  enum room_status: { waiting: 0, in_progress: 1, finished: 2 } # ルームステータス
end
