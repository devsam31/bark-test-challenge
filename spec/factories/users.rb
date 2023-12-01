# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "Password1!#{Faker::Internet.password(min_length: 8)}" }
    password_confirmation { password }
  end
end
