class Admins::PostCommentsController < ApplicationController
    
    def destroy
        @post_comment = PostComment.find(params[:id])
        if @post_comment.destroy
            render :index
        end
    end
    
    private
    def post_comment_params
        params.require(:post_comment).permit(:comment, :post_id, :user_id)
    end
end
