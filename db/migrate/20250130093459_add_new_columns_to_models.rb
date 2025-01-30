class AddNewColumnsToModels < ActiveRecord::Migration[6.0]
  def change
    # Genreモデル: introductionカラム追加 (TEXT, NULL許可)
    add_column :genres, :introduction, :text, null: true

    # QuizRoomAssociationモデル: user_idカラム追加 (BIGINT, 外部キー)
    add_column :quiz_room_associations, :user_id, :bigint, null: false
    add_foreign_key :quiz_room_associations, :users

    # QuizRoomモデル: questioner_id, quiz_id, room_statusカラム追加
    add_column :quiz_rooms, :questioner_id, :bigint, null: true
    add_column :quiz_rooms, :quiz_id, :bigint, null: true
    add_column :quiz_rooms, :room_status, :integer, null: false, default: 0

    # 外部キー設定（questioner_id, quiz_id）
    add_foreign_key :quiz_rooms, :users, column: :questioner_id
    add_foreign_key :quiz_rooms, :quizzes, column: :quiz_id

    # Userモデル: statusカラム追加 (デフォルト値0, NULL許可)
    add_column :users, :status, :integer, null: false, default: 0
  end
end
