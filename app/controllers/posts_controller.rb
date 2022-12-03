class PostsController < ApplicationController
  before_action :fetch_user, only: %i[index show]

  def index
    @user = User.find(params[:user_id])
    @posts = @user ? @user.posts : Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @user = current_user
    @post.user = @user
    @post.likes_counter = 0
    @post.comments_counter = 0

    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to user_posts_path(@user)
    else
      flash[:alert] = 'Post was not created.'
      redirect_to new_post_path
    end
  end

  def show
    @post = @user ? @user.posts.find(params[:id]) : Post.find(params[:id])
  end

  private

  def fetch_user
    return nil unless params[:user_id]

    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :text)
  end
end
