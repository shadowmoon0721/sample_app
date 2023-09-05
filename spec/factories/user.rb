FactoryBot.define do
  factory :user do
    name { 'Michael Example' }
    email { 'michael@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { true }

    trait :second_user do
      name { 'Sterling Archer' }
      email { 'duchess@example.gov' }
      password { 'password' }
      password_confirmation { 'password' }
      admin { false }
    end

    trait :third_user do
      name { 'Lana Kane' }
      email { 'hands@example.com' }
      password { 'password' }
      password_confirmation { 'password' }
      admin { false }
    end

    trait :fourth_user do
      name { 'Malory Archer' }
      email { 'boss@example.com' }
      password { 'password' }
      password_confirmation { 'password' }
      admin { false }
    end

    trait :continuous_users do
      sequence(:name) { |n| "User #{n}" }
      sequence(:email) { |n| "user-#{n}@example.com" }
      password { 'password' }
      password_confirmation { 'password' }
      admin { false }
    end
  end
end

