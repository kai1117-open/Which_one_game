class AddSelectedChoiceToQuizRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :quiz_rooms, :selected_choice, :string, null: true, default: ""
  end
end
