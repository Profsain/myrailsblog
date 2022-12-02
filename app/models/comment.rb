class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :increment_comment_counter

  # update comment counter
  def increment_comment_counter
    post.increment!(:comments_counter)
  end
end
