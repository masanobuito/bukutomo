class Admins::UsersController < ApplicationController

  before_action :user_signed_in
  before_action :authenticate_admin!
  before_action :store_location

  def index
    @users = User.all.page(params[:page]).per(10).reverse_order
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
