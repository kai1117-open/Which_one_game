class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def search
    if params[:query].present?
      @users = User.where("name LIKE ?", "%#{params[:query]}%")
    else
      @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to public_user_path(@user), notice: "ユーザー登録が完了しました！"
    else
      render :new
    end
  end


  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to public_user_path(@user), notice: "プロフィールを更新しました！"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduction)
  end
end
