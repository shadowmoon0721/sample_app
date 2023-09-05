FactoryBot.define do
  factory :user do
    name { 'Michael Example' }
    email { 'michael@example.com' }
    password { 'password' }
    password_confirmation { 'password' }

    trait :second_user do
      name { 'Sterling Archer' }
      email { 'duchess@example.gov' }
      password { 'password' }
      password_confirmation { 'password' }
    end

    trait :third_user do
      name { 'Lana Kane' }
      email { 'hands@example.com' }
      password { 'password' }
      password_confirmation { 'password' }
    end

    trait :fourth_user do
      name { 'Malory Archer' }
      email { 'boss@example.com' }
      password { 'password' }
      password_confirmation { 'password' }
    end

    trait :continuous_users do
      sequence(:name) { |n| "User #{n}" }
      sequence(:email) { |n| "user-#{n}@example.com" }
      password { 'password' }
      password_confirmation { 'password' }
    end
  end

  # factory :continuous_users, class: User do
  #   sequence(:name) { |n| "User #{n}" }
  #   sequence(:email) { |n| "user-#{n}@example.com" }
  #   password { 'password' }
  #   password_confirmation { 'password' }
  # end
end

