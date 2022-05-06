class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.author = current_user
    @comment.post = @post

    if @comment.save
      flash[:notice] = 'Comment created!'
      redirect_to user_post_path(@post.author, @post)
    else
      flash[:notice] = 'Comment was not created.'
    end
  end
end
