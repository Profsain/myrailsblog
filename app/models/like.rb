class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  after_save :increment_like_counter

  # update like counter
  def increment_like_counter
    post.increment!(:likes_counter)
  end
end
