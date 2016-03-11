FactoryGirl.define do
  factory :user do
    name 'Name'
    surname 'Surname'
    email 'user@example.com'
    password 'foobar01'
    password_confirmation 'foobar01'
    provider 'provider'
  end
end