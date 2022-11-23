class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # update like counter
  def increase_like_counter
    self.post.likes_counter += 1
    self.post.save
  end
end
