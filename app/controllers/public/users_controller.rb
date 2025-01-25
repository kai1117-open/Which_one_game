class Public::UsersController < ApplicationController

  def index

  end

  def show

  end
 

  def edit
    
  end

  def sarch

  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :email, :password, :password_confirmation)
  end
  
end
