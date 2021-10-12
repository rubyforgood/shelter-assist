admin = Person.create!(
  full_name: "Ad Ministrator",
  nick_name: "Admin",
  email: 'admin@test.com',
  password: 'password',
  admin: true,
  street: "123 main st.",
  is_home_during_day: true,
  phone: '123-555-1212',
  transportation: 'car'
)

person = Person.create!(
  full_name: "Person",
  email: "foster@test.com",
  street: "123 main st.",
  is_home_during_day: true,
  phone: '123-555-1212',
  transportation: 'car'
)

#   Rescue.create!(
#   file_name: "cutepic.png",
#   email: "rescue@gmail.com",
#   name: "Jon smith",
#   phone_number: "123-456-7892"
# )