FactoryBot.define do
  factory :walkcourse do
    title { 'rspectest' }
    description { 'rspectest' }
    time_to_first_spot { 1 }
    start_station { '東京' }
    goal_station { '有楽町' }
    coursepic { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image/monster11.png')) }
  end
  factory :otherwalkcourse, class: Walkcourse do
    title { 'otherrspectest' }
    description { 'otherrspectest' }
  end
  factory :nested_walkcourse, class: Walkcourse do
    title { 'rspectest' }
    description { 'rspectest' }
    time_to_first_spot { 5 }

    trait :with_nested_instances do
      after( :create ) do |walkcourse|
        create :spot, id: walkcourse.id
      end
    end
  end
end
