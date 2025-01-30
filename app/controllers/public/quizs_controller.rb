class Public::QuizsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # ログイン必須のアクションを制限
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]
  before_action :authorize_quiz, only: [:edit, :update, :destroy] # 作成者のみ編集・削除可能

  # クイズ一覧
  def index
    @quizzes = Quiz.includes(:genre, :creator).order(created_at: :desc)
  end

  # 新規クイズ作成フォーム
  def new
    @quiz = Quiz.new
  end

  # クイズ作成処理
  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.creator_id = current_user.id # `creator_id` を設定
  
    if @quiz.save
      redirect_to public_quiz_path(@quiz), notice: "クイズが作成されました！"
    else
      render :new
    end
  end

  # クイズ詳細
  def show
  end

  # クイズ編集フォーム
  def edit
  end

  # クイズ更新処理
  def update
    if @quiz.update(quiz_params)
      redirect_to public_quiz_path(@quiz), notice: "クイズが更新されました！"
    else
      render :edit
    end
  end

  # クイズ削除処理
  def destroy
    @quiz.destroy
    redirect_to public_quizs_path, notice: "クイズが削除されました。"
  end

  private

  # クイズのパラメータを許可
  def quiz_params
    params.require(:quiz).permit(:question_text, :choice_1, :choice_2, :genre_id, :creator_id)
  end

  # 指定のクイズを取得
  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  # クイズの編集・削除を制限（作成者のみ）
  def authorize_quiz
    redirect_to public_quizs_path, alert: "編集権限がありません。" unless @quiz.creator == current_user
  end
end
