class Api::PostsController < Api::ApiController
  def index
    @user = User.find(params[:user_id])
    @posts = @user ? @user.posts : Post.all.includes(:comments)
    render json: @posts
  end
end
