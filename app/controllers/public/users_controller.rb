class Public::UsersController < ApplicationController

  def index

  end

  def show

  end
 
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :email, :password, :password_confirmation)
  end
  
end
