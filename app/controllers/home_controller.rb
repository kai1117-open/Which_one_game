class HomeController < ApplicationController
  def index
      @user = current_user if user_signed_in? # ログインユーザーを取得
      @quizzes = Quiz.includes(:genre, :creator).order(created_at: :desc).limit(5)
  end
end
