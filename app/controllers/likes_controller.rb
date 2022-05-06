class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])

    @like = @post.likes.new(author: @user)

    flash[:notice] = if @like.save
                       'Liked!'
                     else
                       'Not liked.'
                     end
    redirect_to user_post_path(@post.author, @post)
  end
end
