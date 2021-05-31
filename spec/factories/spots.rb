FactoryBot.define do
  factory :spot do
    name { 'rspectest' }
    description { 'rspectest' }
    transit_time { 20 }
    time_required { 20 }
    address { '東京都千代田区北の丸公園１−１' }
    latitude { 35.6896936 }
    longitude { 139.750396 }
    spotpic { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image/monster11.png')) }
    walkcourse nil
  end
end
