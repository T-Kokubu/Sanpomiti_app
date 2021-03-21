class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :prefecture, presence: true, inclusion: { in: %w[東京 埼玉 神奈川 千葉 茨城],
                                                      message: '%<value> の都道府県名は無効です' }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6, maximum: 16 }
end
