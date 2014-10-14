FactoryGirl.define do
  factory :bookmark do
    user_id 1
    title Faker::Name.title
    url "#{Faker::Lorem.characters(6)}.com"
    created_at Faker::Time.between(14.days.ago, Time.now)
  end
end
