 # coding: utf-8
 
User.create!(name: "管理者",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             employee_number: "1111",
             uid: "1",
             admin: true)
              
User.create!(name: "上長A",
             email: "superior-a@email.com",
             password: "password",
             password_confirmation: "password",
             employee_number: "1112",
             uid: "2",
             superior: true)
             
User.create!(name: "上長B",
             email: "superior-b@email.com",
             password: "password",
             password_confirmation: "password",
             employee_number: "1113",
             uid: "3",
             superior: true)
              
100.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               employee_number: 3+n,
               uid: "#{1113}+#{n}")
end 