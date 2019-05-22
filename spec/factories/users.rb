FactoryBot.define do
  factory :user do
    name { "test_user" }
    email { 'test@example.com' }
    password { 'testtest' }
  end

  factory :admin_user, class: User do
    name { 'admin' }
    email { 'admin@example.com' }
    password { 'adminadmin' }
    admin { 'true' }
  end
end