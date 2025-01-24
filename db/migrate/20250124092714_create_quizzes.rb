class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.references :genre, null: false, foreign_key: true
      t.text :question_text, null: false
      t.string :choice_1, null: false
      t.string :choice_2, null: false

      t.timestamps
    end
  end
end