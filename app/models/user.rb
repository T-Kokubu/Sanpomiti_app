class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6, maximum: 16 }
  belongs_to :prefecture
  has_many :walkcourses, dependent: :destroy


  has_many :favorites, dependent: :destroy
  has_many :likes, through: :favorites, source: :like
  has_many :reverses_of_favorite, class_name: "Favorite", foreign_key: "like_id"
  has_many :subjects, through: :reverses_of_favorite, source: :user

  def like(like_walkcourse)
      self.favorites.find_or_create_by(like_id: like_walkcourse.id)
  end

  def unlike(like_walkcourse)
    favorite = self.favorites.find_by(like_id: like_walkcourse.id)
    favorite.destroy if favorite
  end

  def liking?(like_walkcourse)
    self.likes.include?(like_walkcourse)
  end

  def feed_favorites
    Walkcourse.where(id: self.like_ids)
  end
end
