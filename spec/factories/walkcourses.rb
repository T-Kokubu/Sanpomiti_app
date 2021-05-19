FactoryBot.define do
  factory :walkcourse do
    title { "rspectest" }
    description { "rspectest" }
  end
  factory :otherwalkcourse, class:  Walkcourse do
    title { "otherrspectest" }
    description { "otherrspectest" }
  end
end
