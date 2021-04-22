class Spot < ApplicationRecord
  belongs_to :walkcourse
  validates :name, length: { maximum: 50 }
  validates :address, length: { maximum: 50 }
  validates :description, length: { maximum: 250 }
  mount_uploader :spotpic, SpotpicUploader
  geocoded_by :address
  after_validation :geocode
end
