admin = Person.create!(
  full_name: "Ad Ministrator",
  nick_name: "Admin",
  email: 'admin@test.com',
  password: 'password',
  is_home_during_day: true,
  phone: '123-555-1212',
  transportation: 'car',
  available_from: 4.days.from_now,
)

admin.add_role(:admin)

person = Person.create!(
  full_name: "Person",
  email: "foster@test.com",
  is_home_during_day: true,
  phone: '123-555-1212',
  transportation: 'car',
  available_from: 3.days.from_now,
  homes_attributes: [
    {
      has_children: false,
      has_fenced_yard: true,
      has_other_adults: true,
      has_other_dog: false,
      has_other_cat: false,
      street: "123 main st.",
      city: "someplace",
      state: "MD",
      zip_code: "20782",
      home_type: "House"
    }
  ]
)

#   Rescue.create!(
#   file_name: "cutepic.png",
#   email: "rescue@gmail.com",
#   name: "Jon Smith",
#   phone_number: "123-456-7892"
# )

# Animal.create!(
#   name: "Canoli",
#   animal_kind: "dog",
#   gender: "female",
#   breed: "Akita",
#   birthdate: Date.new(2019, 5, 12)
# )
# Animal.create!(
#   name: "Rafo",
#   animal_kind: "dog",
#   gender: "male",
#   breed: "Beagle",
#   birthdate: Date.new(2020, 7, 16)

# )
# Animal.create!(
#   name: "Nalo",
#   animal_kind: "cat",
#   gender: "male",
#   breed: "Burmese",
#   birthdate: Date.new(2018, 6, 2)
# )