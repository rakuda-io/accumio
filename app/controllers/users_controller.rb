class UsersController < ApplicationController

  def index
    @users = User.all.order(id: 'DESC')
  end

  def show
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: 'ユーザー情報を更新しました'
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end

end
