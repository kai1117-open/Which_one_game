class Admin::QuizRoomsController < ApplicationController
  before_action :set_quiz_room, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  def index
    @quiz_rooms = QuizRoom.all
  end

  def show
  end

  def edit
  end

  def update
    if @quiz_room.update(quiz_room_params)
      redirect_to admin_quiz_room_path(@quiz_room), notice: 'クイズ部屋を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @quiz_room.destroy
    redirect_to admin_quiz_rooms_path, notice: 'クイズ部屋を削除しました。'
  end

  private

  def set_quiz_room
    @quiz_room = QuizRoom.find(params[:id])
  end

  def quiz_room_params
    params.require(:quiz_room).permit(:room_name, :questioner_id, :quiz_id, :room_status)
  end
end