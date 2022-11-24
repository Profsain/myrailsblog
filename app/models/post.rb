class Post < ApplicationRecord
  belongs_to :author, class_name: User
  has_many :comments
  has_many :likes

  # update post counter
  def increase_post_counter
    user.posts_counter += 1
    user.save
  end

  # Return 5 most recent posts
  def recent_posts
    Post.order(created_at: :desc).limit(5)
  end
end
