admin = Foster.create!(
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

foster = Foster.create!(
  full_name: "Foster",
  email: "foster@test.com",
  street: "123 main st.",
  is_home_during_day: true,
  phone: '123-555-1212',
  transportation: 'car'
)
