class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @current_user = current_user
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to user_posts_path(@user), notice: 'Post was successfully created.'
    else
      redirect_to user_posts_path(@user), notice: 'Something went wrong!'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find_by_id(params[:post_id])
    if @post.destroy
      flash[:success] = 'Post deleted successfully!'
    else
      flash[:error] = 'Something went wrong, please try it again!'
    end
    redirect_to user_posts_path(@user)
  end
end
