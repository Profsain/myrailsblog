class User < ApplicationRecord
  has_many :posts
  has_many :comments

  # Return 3 most recent users
  def recent_users
    User.order(created_at: :desc).limit(3)
  end
end
