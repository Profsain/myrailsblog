class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = @current_user.comments.new(params)
    @comment.post_id = params[:post_id]

    @comment.save if @comment.valid?
    redirect_to posts_path(@comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
