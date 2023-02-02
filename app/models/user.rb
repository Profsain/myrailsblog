class User < ApplicationRecord

  after_initialize :set_defaults
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :posts
  has_many :comments
  has_many :likes

  # validation
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Return 3 most recent users post
  def fetch_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def set_defaults
    self.posts_counter = 0 if posts_counter.nil?
    self.photo = 'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png' if photo.nil?
  end
end
