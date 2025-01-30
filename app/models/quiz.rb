class Quiz < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  belongs_to :genre, optional: true

  validates :question_text, presence: true
  validates :choice_1, presence: true
  validates :choice_2, presence: true
end
