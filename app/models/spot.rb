class Spot < ApplicationRecord

  belongs_to :walkcourse
  validates :name, length: { maximum: 50 }
  validates :address, length: { maximum: 50 }
  validates :description, length: { maximum: 250 }

  before_save do
    # ここでbinding.pryで止めてselfとはなんなのか確認してみましょう！
    binding.pry
    # selfといのは、Spotオブジェクトになります。
    # 例えば、Spot.create(id: 1, name: '町田駅')というspotがあった場合に
    # Spot.find(1).update(name: '新宿駅')
    # とやった場合、before_saveの中を通ります。
    # このときselfが指すのはSpot.find(1)のオブジェクトになります。

    # 自身が属するWalkcourseが持っているspotの中で最初の場合
    if self.walkcourse.spots.first == self
      self.transit_time = nil
      self.time_required = nil
    end

    # 自身が属するWalkcourseが持っているspotの中で最後の場合
    if self.walkcourse.spots.last == self
      self.time_required = nil
    end
  end
end
