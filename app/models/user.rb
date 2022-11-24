class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  # Return 3 most recent users post
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
