class QuizRoom < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  belongs_to :questioner, class_name: "User", foreign_key: "questioner_id", optional: true
  belongs_to :quiz, optional: true
  has_many :quiz_room_associations, dependent: :destroy
  has_many :participants, through: :quiz_room_associations, source: :user

  
  validates :selected_choice, inclusion: { in: [nil, "choice_1", "choice_2"], message: "must be either 'choice_1' or 'choice_2'" }
  enum room_status: { waiting: 0, in_progress: 1, interval: 2 } # ルームステータス


  # 指定されたユーザーが選択肢を選んだか確認するメソッド
  def user_selected_choice?(user_id)
    # 選択肢のボタンを押したユーザーが `selected_choice` に保存されているか確認
    selected_choice.present? && User.find(user_id).present?
  end

  def room_status_i18n
    {
      "waiting" => "待機中",
      "in_progress" => "ゲーム中（出題フェーズ）",
      "interval" => "ゲーム中（回答発表フェーズ）"
    }[room_status]
  end

end
