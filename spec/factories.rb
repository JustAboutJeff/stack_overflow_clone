FactoryGirl.define do

  factory :user do
    user_name "JohnDoe"
    email "JohnDoe@gmail.com"
    password "password"
    password_confirmation "password"
  end
end
