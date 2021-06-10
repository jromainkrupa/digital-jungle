FactoryBot.define do
  factory :workshop_booking do
    user { nil }
    workshop { nil }
  end

  factory :workshop do
    name { "MyString" }
    start_date { "2021-06-08 17:23:05" }
    duration { 1 }
  end

  factory :like do
    user { nil }
    project { nil }
    is_like { false }
  end

  factory :project_message do
    username { "MyString" }
    body { "MyText" }
    project { nil }
  end

  factory :project_slack_message do
    project { nil }
    slack_message { nil }
  end

  factory :slack_message do
    username { "MyString" }
    body { "MyText" }
  end

  factory :investment do
    user { nil }
    project { nil }
    amount { 1 }
  end

  factory :pitch do
    title { "MyString" }
    project { nil }
    is_publishable { false }
  end
  factory :user do
    first_name   { 'Jean' }
    last_name    { Faker::Name.unique.name }
    email        { Faker::Internet.email }
    phone_number { '0695500784' }
    is_entrepreneur { true }
    password     { Faker::Internet.password }
  end

  factory :project do
    user
    name { "MyString" }
    description { "This a super cool description of a project, yes it's a bit to have to fill 50 characters." }
  end


end