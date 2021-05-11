class Spot < ApplicationRecord
  belongs_to :walkcourse
  validates :name, length: { maximum: 50 }
  validates :address, length: { maximum: 50 }
  validates :description, length: { maximum: 250 }
  validates :transit_time, numericality: { only_integer: true }, allow_blank: true
  validates :time_required, numericality: { only_integer: true }, allow_blank: true
  mount_uploader :spotpic, SpotpicUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
