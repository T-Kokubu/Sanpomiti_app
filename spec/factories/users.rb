FactoryBot.define do
  factory :user do
    name                  { "sampleboy" }
    email                 { "sample@sample.com" }
    password              { "12345678" }
    password_confirmation { "12345678" }
  end
end
