class Admins::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_users_path
  end

  private
  def user_params
      params.require(:user).permit(:name)
  end
end
