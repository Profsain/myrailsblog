class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # update comment counter
  def increase_comment_counter
    self.post.comments_counter += 1
    self.post.save
  end
end
