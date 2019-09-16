class Users::FavoritesController < ApplicationController
  def index
  end

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: params[:post_id])
    favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    favorite.destroy
  end
end