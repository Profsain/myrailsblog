class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @current_user.likes.new(post_id: @post.id)

    @like.save if @like.valid?
    redirect_to posts_path @like.post
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
