class Walkcourse < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy, foreign_key: :like_id

  has_many :spots, dependent: :destroy
  accepts_nested_attributes_for :spots

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :time_to_first_spot, numericality: { only_integer: true }, allow_blank: true
  validates :start_station, length: { maximum: 20 }
  validates :goal_station, length: { maximum: 20 }
  mount_uploader :coursepic, CoursepicUploader
  validates :coursepic, presence: true
end
