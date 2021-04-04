class Spot < ApplicationRecord
  before_save do
    transit_time[0] = nil unless nil
    time_required[0] = nil unless nil
    time_required[-1] = nil unless nil
  end

  belongs_to :walkcourse
  validates :name, length: { maximum: 50 }
  validates :address, length: { maximum: 50 }
  validates :description, length: { maximum: 250 }
end
