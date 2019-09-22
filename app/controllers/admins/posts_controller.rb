class Admins::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = @post.post_comments
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admins_posts_path
  end


  private
  def post_params
    params.require(:post).permit(:title, :body, :user, :image, :remove_image)
  end
end
