# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2025_02_13_042259) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followed_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_follows_on_followed_id"
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "introduction"
  end

  create_table "quiz_room_associations", force: :cascade do |t|
    t.integer "quiz_room_id", null: false
    t.integer "quiz_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["quiz_id"], name: "index_quiz_room_associations_on_quiz_id"
    t.index ["quiz_room_id"], name: "index_quiz_room_associations_on_quiz_room_id"
  end

  create_table "quiz_rooms", force: :cascade do |t|
    t.string "room_name", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "questioner_id"
    t.integer "quiz_id"
    t.integer "room_status", default: 0, null: false
    t.string "selected_choice"
    t.index ["owner_id"], name: "index_quiz_rooms_on_owner_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer "creator_id", null: false
    t.integer "genre_id"
    t.text "question_text", null: false
    t.string "choice_1", null: false
    t.string "choice_2", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_quizzes_on_creator_id"
    t.index ["genre_id"], name: "index_quizzes_on_genre_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "introduction"
    t.integer "status", default: 0, null: false
    t.integer "friend_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["friend_id"], name: "index_users_on_friend_id", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "follows", "users", column: "followed_id"
  add_foreign_key "follows", "users", column: "follower_id"
  add_foreign_key "quiz_room_associations", "quiz_rooms"
  add_foreign_key "quiz_room_associations", "quizzes"
  add_foreign_key "quiz_room_associations", "users"
  add_foreign_key "quiz_rooms", "quizzes"
  add_foreign_key "quiz_rooms", "users", column: "owner_id"
  add_foreign_key "quiz_rooms", "users", column: "questioner_id"
  add_foreign_key "quizzes", "genres"
  add_foreign_key "quizzes", "users", column: "creator_id"
end
