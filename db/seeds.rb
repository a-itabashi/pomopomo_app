20.times do |n|
  name = Faker::Pokemon.name
  email = Faker::Internet.email
  uid = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               uid: uid,
               )
  content = Faker::Music.album
  user = User.last
  Post.create!(content: content,
               user_id: user.id
              )
end

1.times do |n|
uid = Faker::Internet.email
User.create!(name: "管理者ユーザー",
             email: "admin@gmail.com",
             password: "adminadmin",
             password_confirmation: "adminadmin",
             uid: uid,
             admin: "true",
            )
end

1.times do |n|
uid = Faker::Internet.email
User.create!(name: "testユーザー",
             email: "test@gmail.com",
             password: "testtest",
             password_confirmation: "testtest",
             uid: uid,
            )
end