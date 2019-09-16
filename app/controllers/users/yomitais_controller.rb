class Users::YomitaisController < ApplicationController
  def index
  end

  def create
    @post = Post.find(params[:post_id])
    yomitai = current_user.yomitais.new(post_id: params[:post_id])
    yomitai.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    yomitai = Yomitai.find_by(post_id: params[:post_id], user_id: current_user.id)
    yomitai.destroy
  end
end