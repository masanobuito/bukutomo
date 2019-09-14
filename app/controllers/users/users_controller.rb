class Users::UsersController < ApplicationController
  def index
    # @users = User.all
    
  end

  def show
    @user = User.find(current_user.id)
  end


  private
      def user_params
          params.require(:user).permit(:name)
      end


end