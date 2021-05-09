FactoryBot.define do
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
    last_name    { 'Krupa' }
    email        { 'c@c.com' }
    phone_number { '0695500784' }
    is_entrepreneur { true }
    password     { 'c@c.com' }
  end

  factory :project do
    user
    name { "MyString" }
    description { "This a super cool description of a project, yes it's a bit to have to fill 50 characters." }
  end


end