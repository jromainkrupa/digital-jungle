FactoryBot.define do
  factory :user do
    first_name   { 'Jean' }
    last_name    { Faker::Name.unique.name }
    email        { Faker::Internet.email }
    phone_number { '0695500784' }
    password     { Faker::Internet.password }
  end
  
  factory :team do
    name { Faker::Name.unique.name }
    owner factory: :user
  end
  
  factory :team_member do
    team
    user
    role { "ADMIN" }
  end
  
  factory :section do
    name { Faker::Name.unique.name }
    price_in_cents { 1 }
  end
  
  factory :team_section do
    team
    section
  end
  
  factory :challenge do
    section
    name { Faker::Name.unique.name }
  end

  factory :exercise do
    name { Faker::Name.unique.name }
    challenge
  end
  
  factory :lecture do
    name { Faker::Name.unique.name }
    challenge
  end
end