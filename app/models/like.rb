class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # update like counter
  def increase_like_counter
    post.likes_counter += 1
    post.save
  end
end
