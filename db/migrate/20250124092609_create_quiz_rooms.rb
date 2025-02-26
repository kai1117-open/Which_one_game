class CreateQuizRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_rooms do |t|
      t.string :room_name, null: false
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end