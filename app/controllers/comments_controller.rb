class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.author = current_user
    @comment.post = @post

    flash[:notice] = if @comment.save
                       'Comment created!'
                     else
                       'Comment was not created.'
                     end
    redirect_to user_post_path(@post.author, @post)
  end
end
