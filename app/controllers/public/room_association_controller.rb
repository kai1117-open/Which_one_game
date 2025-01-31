class Public::RoomAssociationController < ApplicationController
  before_action :authenticate_user!

  def create
    @quiz_room = QuizRoom.find(params[:quiz_room_id])
    unless QuizRoomAssociation.exists?(quiz_room_id: @quiz_room.id, user_id: current_user.id)
      QuizRoomAssociation.create(quiz_room_id: @quiz_room.id, user_id: current_user.id, quiz_id: @quiz_room.quiz_id)
      redirect_to room_public_quiz_rooms_path(id: @quiz_room.id), notice: "部屋に参加しました。"
    else
      redirect_to room_public_quiz_rooms_path(id: @quiz_room.id), alert: "すでに参加しています。"
    end
  end

  def destroy
    @quiz_room_association = QuizRoomAssociation.find_by(quiz_room_id: params[:quiz_room_id], user_id: current_user.id)
    if @quiz_room_association
      @quiz_room_association.destroy
      redirect_to top_public_quiz_rooms_path, notice: "部屋から退出しました。"
    else
      redirect_to top_public_quiz_rooms_path, alert: "退出できませんでした。"
    end
  end
end
