class Admin::QuizsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @quizs = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update(quiz_params)
      redirect_to admin_quiz_path(@quiz), notice: 'クイズを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to admin_quizs_path, notice: 'クイズを削除しました。'
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :content, :genre_id)
  end
end
