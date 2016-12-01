FactoryGirl.define do
  factory :user do
    name "Example"
    email "example@test.com"
    password "examplepass"
    password_confirmation "examplepass"
    gender 1
    date_of_birth "1995-03-29"
    is_admin false
  end
end
