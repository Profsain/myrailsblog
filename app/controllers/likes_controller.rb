class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.user = current_user

    @like.save if @like.valid?
    redirect_to posts_path @like.post
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
