class ChangeSelectedChoiceDefaultInQuizRooms < ActiveRecord::Migration[6.1]
  def change
    change_column_default :quiz_rooms, :selected_choice, nil
  end
end
