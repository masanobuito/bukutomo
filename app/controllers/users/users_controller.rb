class Users::UsersController < ApplicationController
  def index
    # ランキング機能
    @favorite_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    @yomitai_ranks = Post.find(Yomitai.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    # ransack
    @search = Post.ransack(params[:q])
    # 記事情報
    @posts = Post.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(current_user.id)
  end

  def search
    # ransack
    @search = Post.ransack(params[:q])
    @results = @search.result
  end


  private
      def user_params
          params.require(:user).permit(:name)
      end


end