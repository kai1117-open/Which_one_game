class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :genre_name, null: false, unique: true

      t.timestamps
    end
  end
end