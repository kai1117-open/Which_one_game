class QuizRoom < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  belongs_to :questioner, class_name: "User", foreign_key: "questioner_id", optional: true
  belongs_to :quiz, optional: true
  has_many :quiz_room_associations, dependent: :destroy
  has_many :participants, through: :quiz_room_associations, source: :user

  
  validates :selected_choice, inclusion: { in: [nil, "choice_1", "choice_2"], message: "must be either 'choice_1' or 'choice_2'" }
  enum room_status: { waiting: 0, in_progress: 1, finished: 2 } # ルームステータス
end
