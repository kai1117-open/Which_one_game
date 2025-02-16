# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  email: "testADMINtest531523@example.com",
  password: "password",
  password_confirmation: "password",
  name: "運営",
  introduction: "これは運営です。",
  status: 0,
  friend_id: nil
)

# クイズのデータリスト
quizzes = [
  { question_text: "いいよ", choice_1: "本当は嫌だけど仕方ない時の「いいよ」", choice_2: "遠慮したい時の「いいよ」" },
  { question_text: "ごめん", choice_1: "自分が悪くない時の「ごめん」", choice_2: "嫌いな人に言う「ごめん」" },
  { question_text: "お願いします", choice_1: "チャンネル登録と好評価を頼む時「お願いします」", choice_2: "お得意様のお客さんに言う「お願いします」" },
  { question_text: "お疲れ様です", choice_1: "早上がりして嬉しい時の「お疲れ様です」", choice_2: "大好きな先輩に言う「お疲れ様です」" },
  { question_text: "おやすみ", choice_1: "早く寝たい時の「おやすみ」", choice_2: "疲れ果てている時の「おやすみ」" }
]

# クイズを作成（genre_idはnil）
quizzes.each do |quiz|
  Quiz.create!(
    creator_id: user.id,
    genre_id: nil,
    question_text: quiz[:question_text],
    choice_1: quiz[:choice_1],
    choice_2: quiz[:choice_2]
  )
end