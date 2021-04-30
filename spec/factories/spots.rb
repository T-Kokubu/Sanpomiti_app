FactoryBot.define do
  factory :spot do
    walkcourse { nil }
    name { 'MyString' }
    transit_time { '2021-04-03 03:59:12' }
    time_required { '2021-04-03 03:59:12' }
    address { 'MyString' }
    description { 'MyText' }
  end
end
