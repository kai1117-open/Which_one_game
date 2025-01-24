class CreateQuizRoomAssociations < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_room_associations do |t|
      t.references :quiz_room, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end