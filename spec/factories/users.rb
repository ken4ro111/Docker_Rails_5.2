FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'test@test.co.jp' }
    password { 'password' }
  end
end