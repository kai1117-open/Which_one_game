class ChangeQuizIdNullOnQuizRoomAssociations < ActiveRecord::Migration[6.1]
  def change
    change_column_null :quiz_room_associations, :quiz_id, true
    change_column_null :quiz_room_associations, :user_id, true
  end
end
