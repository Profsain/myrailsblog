class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  # validation
  validates :name, presence: true
  validates :posts_count, numericality: { greater_than_or_equal_to: 0 }


  # Return 3 most recent users post
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
