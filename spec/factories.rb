FactoryGirl.define do
  factory :user do
    name     "Example User"
    email    "example_user@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end