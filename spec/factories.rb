FactoryBot.define do
  factory :project do
    user { nil }
    name { "MyString" }
    description { "MyString" }
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