FactoryBot.define do
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

  factory :project do
    user { nil }
    name { "MyString" }
    description { "This a super cool description of a project, yes it's a bit to have to fill 50 characters." }
  end

  factory :user do
    first_name   { 'Jean' }
    last_name    { 'Krupa' }
    email        { 'c@c.com' }
    phone_number { '0695500784' }
    is_entrepreneur { true }
    password     { 'c@c.com' }
  end

end