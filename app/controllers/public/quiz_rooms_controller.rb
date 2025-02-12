class Public::QuizRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz_room, only: [:room, :quiz_select, :quiz_set, :develop_select, :develop_set, :destroy, :start_game]

  # クイズ部屋のトップページ（作成・参加ページのリンク）
  def top
    @joined_user = QuizRoomAssociation.where(user_id: current_user.id)
    @joined_quiz_rooms = @joined_user.map(&:quiz_room)
  end

  # 部屋の作成ページ
  def make
    @quiz_room = QuizRoom.new
  end

  # 部屋の作成処理
  def create
    @quiz_room = QuizRoom.new(quiz_room_params)
    @quiz_room.owner_id = current_user.id # ログインユーザーをオーナーに設定
  
    if @quiz_room.save
      # 作成者も自動で参加（quiz_id は未設定でOK）
      QuizRoomAssociation.create!(quiz_room_id: @quiz_room.id, user_id: current_user.id, quiz_id: nil)
  
      redirect_to room_public_quiz_rooms_path(id: @quiz_room.id), notice: "部屋が作成されました！"
    else
      render :make
    end
  end

  # 部屋の検索・参加ページ
  def join
    if params[:room_name].present?
      @quiz_rooms = QuizRoom.where(room_name: params[:room_name]) # 完全一致検索
    else
      @quiz_rooms = []
    end
  end

  # 部屋のメイン画面（出題者やクイズの選択）
  def room
    @participants = QuizRoomAssociation.where(quiz_room_id: @quiz_room.id).map(&:user)
  end

  # 出題者の選択画面
  def develop_select
    @participants = QuizRoomAssociation.where(quiz_room_id: @quiz_room.id).map(&:user)
  end

  def develop_set
    if params[:questioner_id].present?
      @quiz_room.update(questioner_id: params[:questioner_id])
      redirect_to room_public_quiz_rooms_path(id: @quiz_room.id), notice: "出題者が設定されました。"
    else
      redirect_to quiz_select_public_quiz_rooms_path(id: @quiz_room.id), alert: "出題者を選択してください。"
    end
  end

  # クイズの選択画面
  def quiz_select
    @quizzes = Quiz.all
    if params[:query].present?
      @quizzes = @quizzes.where("question_text LIKE ?", "%#{params[:query]}%")
    end
    if params[:genre_id].present?
      @quizzes = @quizzes.where(genre_id: params[:genre_id])
    end
  end

  # クイズを設定
  def quiz_set
    if params[:quiz_id].present?
      @quiz_room.update(quiz_id: params[:quiz_id])
      redirect_to room_public_quiz_rooms_path(id: @quiz_room.id), notice: "クイズが設定されました。"
    else
      redirect_to quiz_select_public_quiz_rooms_path(id: @quiz_room.id), alert: "クイズを選択してください。"
    end
  end

  # 部屋を削除
  def destroy
    if @quiz_room.owner_id == current_user.id
      @quiz_room.destroy
      redirect_to top_public_quiz_rooms_path, notice: "部屋を削除しました。"
    else
      redirect_to room_public_quiz_rooms_path(id: @quiz_room.id), alert: "削除権限がありません。"
    end
  end

  # ゲーム開始（ルームステータス変更）
  def start_game
    if @quiz_room.owner_id == current_user.id
      @quiz_room.update(room_status: :in_progress)
      redirect_to room_public_quiz_rooms_path(id: @quiz_room.id), notice: "ゲームを開始しました！"
    else
      redirect_to room_public_quiz_rooms_path(id: @quiz_room.id), alert: "ゲーム開始の権限がありません。"
    end
  end

  def update_selected_choice
    @quiz_room = QuizRoom.find(params[:id])
    
    if ["choice_1", "choice_2"].include?(params[:selected_choice])
      @quiz_room.update(selected_choice: params[:selected_choice])
      flash[:notice] = "選択肢が更新されました。"
    else
      flash[:alert] = "無効な選択肢です。"
    end

    redirect_to room_public_quiz_rooms_path(id: @quiz_room.id), notice: "ゲームを開始しました！"
  end

  private

  def set_quiz_room
    @quiz_room = QuizRoom.find(params[:id])
  end

  def quiz_room_params
    params.require(:quiz_room).permit(:room_name)
  end
end
