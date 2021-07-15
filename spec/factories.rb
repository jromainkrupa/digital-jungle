FactoryBot.define do
  factory :team_section do
    team { nil }
    section { nil }
  end

  factory :plan do
    name { "MyString" }
  end

  factory :section do
    name { "MyString" }
    price_in_cents { 1 }
  end

  factory :team_member do
    team { nil }
    user { nil }
    role { "MyString" }
  end

  factory :camp_team do
    camp { nil }
    team { nil }
  end

  factory :user do
    first_name   { 'Jean' }
    last_name    { Faker::Name.unique.name }
    email        { Faker::Internet.email }
    phone_number { '0695500784' }
    password     { Faker::Internet.password }
  end

  factory :team do
    name { "MyString" }
    owner factory: :user
  end

  factory :user_team do
    team
    user
    is_admin { false }
  end

  factory :camp do
    name { "MyString" }
    is_current { false }
    start_date { "2021-07-13 10:19:13" }
  end

end