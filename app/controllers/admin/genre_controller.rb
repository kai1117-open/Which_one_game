class Admin::GenreController < ApplicationController
  before_action :set_genre, only: [:show, :edit, :update, :destroy]

  def index
    @genres = Genre.all
  end

  def show
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genre_index_path, notice: "ジャンルを作成しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      redirect_to admin_genre_index_path, notice: "ジャンルを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @genre.destroy
    redirect_to admin_genre_index_path, notice: "ジャンルを削除しました。"
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:genre_name, :introduction)
  end
end
