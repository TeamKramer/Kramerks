FactoryGirl.define do
  factory :user do
    email 'usert@test.com'
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.now
  end
end
