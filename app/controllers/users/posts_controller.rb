class Users::PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id)
    @user = User.find(current_user.id)
    # @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post.post_comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
        if 
            @post.save
            redirect_to users_posts_path, notice: ""
        else
            render :new
        end
    
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    if 
        @post.save
        redirect_to users_posts_path, notice: ""
    else
        render :edit
    end
end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to users_posts_path
  end


  private
  def post_params
    params.require(:post).permit(:title, :body, :user, :image, :remove_image)
  end

end