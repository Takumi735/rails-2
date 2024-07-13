class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path, notice: 'プロフィールが更新されました'
    else
      render :edit
    end
  end

  def account
    @user = current_user
  end

  def profile
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :avatar, :name, :bio)
  end

end
