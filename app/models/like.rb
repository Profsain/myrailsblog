class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # update like counter
  def increment_like_counter
    post.likes_counter += 1
    post.save
  end
end
