class Spot < ApplicationRecord
  belongs_to :walkcourse
  validates :name, length: { maximum: 50 }
  validates :address, length: { maximum: 50 }
  validates :description, length: { maximum: 250 }
  # transit_time
  # time_required
end
