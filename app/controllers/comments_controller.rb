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

  # delet comment
  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @comment.destroy
    @post.comments_counter -= 1
    redirect_to posts_path(@comment.post) if @post.save
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
