class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # update comment counter
  def increment_comment_counter
    post.comments_counter += 1
    post.save
  end
end
