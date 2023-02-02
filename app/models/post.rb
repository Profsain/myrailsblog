class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  after_save :posts_counter

  # validation
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # update post counter
  def posts_counter
    user.increment!(:posts_counter)
  end

  # Return 5 most recent posts
  def recent_posts
    Post.order(created_at: :desc).limit(5)
  end

  def fetch_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
