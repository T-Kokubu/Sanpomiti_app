FactoryBot.define do
  factory :favorite, class: Favorite do
    like_id { like.id }
  end
  factory :otherfavorite, class: Favorite do
    like_id { like.id }
  end
end
