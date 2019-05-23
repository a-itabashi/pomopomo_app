FactoryBot.define do
  factory :user do
    name { "test_user" }
    email { 'test@example.com' }
    uid {User.create_unique_string}
    password { 'testtest' }
  end

  factory :admin_user, class: User do
    name { 'admin' }
    email { 'admin@example.com' }
    uid {User.create_unique_string}
    password { 'adminadmin' }
    admin { 'true' }
  end
end