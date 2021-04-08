FactoryBot.define do
  factory :user do
    first_name   { 'Jean' }
    last_name    { 'Krupa' }
    email        { 'c@c.com' }
    phone_number { '0695500784' }
    is_entrepreneur { false }
    password     { 'c@c.com' }
  end

end