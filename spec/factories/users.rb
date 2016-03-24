FactoryGirl.define do
  factory :user, class: User do
    name 'Name'
    surname 'Surname'
    email 'user@example.com'
    password 'foobar01'
    password_confirmation 'foobar01'
    provider 'email'
    uid 'uid'
  end
  factory :user_not_valid, class: User do
    name ''
    surname ''
    email ''
    password ''
    password_confirmation ''
    provider ''
    uid ''
  end
end