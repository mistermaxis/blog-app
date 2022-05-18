class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params.require(:comment).permit(:text))
    @comment.author = current_user
    @comment.post = @post

    flash[:notice] = if @comment.save
                       'Comment created!'
                     else
                       'Comment was not created.'
                     end
    redirect_to user_post_path(@post.author, @post)
  end

  def destroy
    @post = Post.find_by_id(params[:post_id])
    @user = User.find_by_id(params[:user_id])
    @comment = @post.comments.find(params[:format])
    if @comment.destroy
      flash[:success] = 'Comment destroyed successfully'
    else
      flash[:error] = 'Error: Comment could not be destroyed'
    end
    redirect_back(fallback_location: root_path)
  end
end
