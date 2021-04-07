class Walkcourse < ApplicationRecord
  belongs_to :user
  has_many :spots, dependent: :destroy
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
  mount_uploader :coursepic, CoursepicUploader
end
