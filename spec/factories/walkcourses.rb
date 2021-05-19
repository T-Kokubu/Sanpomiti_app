FactoryBot.define do
  factory :walkcourse do
    title { "rspectest" }
    description { "rspectest" }
    time_to_first_spot { 1 }
    start_station { "東京" }
    goal_station { "有楽町" }
  end
  factory :otherwalkcourse, class:  Walkcourse do
    title { "otherrspectest" }
    description { "otherrspectest" }
  end
end
