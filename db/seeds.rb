# admin = Person.create!(
#   full_name: "Ad Ministrator",
#   nick_name: "Admin",
#   email: 'admin@test.com',
#   password: 'password',
#   street: "123 main st.",
#   is_home_during_day: true,
#   phone: '123-555-1212',
#   transportation: 'car'
# )

# admin.add_role(:admin)

# person = Person.create!(
#   full_name: "Person",
#   email: "foster@test.com",
#   street: "123 main st.",
#   is_home_during_day: true,
#   phone: '123-555-1212',
#   transportation: 'car'
# )

#   Rescue.create!(
#   file_name: "cutepic.png",
#   email: "rescue@gmail.com",
#   name: "Jon smith",
#   phone_number: "123-456-7892"
# )

  Animal.create!(
  name: "Canoli",
  animal_kind: "dog",
  gender: "female",
  breed: "Akita",
  birthdate: Date.new(2019, 5, 12)
)
Animal.create!(
  name: "Rafo",
  animal_kind: "dog",
  gender: "male",
  breed: "Beagle",
  birthdate: Date.new(2020, 7, 16)

)
Animal.create!(
  name: "Nalo",
  animal_kind: "cat",
  gender: "male",
  breed: "Burmese",
  birthdate: Date.new(2018, 6, 2)
)