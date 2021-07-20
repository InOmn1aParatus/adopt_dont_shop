Application.destroy_all
Pet.destroy_all
PetApplication.destroy_all
Shelter.destroy_all

# Applications

app1 = Application.create!(
  name: 'Matt Kragen',
  street: '1234 One St',
  city: 'Vista',
  state: 'California',
  zip_code: 90123,
  status: 'In Progress',
  description: 'Definitely a dog dude'
)

app2 = Application.create!(
  name: 'Doug Dye',
  street: '2345 Two Ave',
  city: 'Portland',
  state: 'Oregon',
  zip_code: 90234,
  status: 'In Progress',
  description: 'Dogs love him'
)

app3 = Application.create!(
  name: 'Ben Law',
  street: '3456 Three Ln',
  city: 'Seattle',
  state: 'Washington',
  zip_code: 90345,
  status: 'In Progress',
  description: 'Knows how to keep them happy'
)

app4 = Application.create!(
  name: 'Rain Ionescu',
  street: '4567 Four Blvd',
  city: 'Phoenix',
  state: 'Arizona',
  zip_code: 90456,
  status: 'In Progress',
  description: 'Lives close to the shelter'
)

app5 = Application.create!(
  name: 'David Down',
  street: '5678 Five Rd',
  city: 'Albuquerque',
  state: 'New Mexico',
  zip_code: 90567,
  status: 'In Progress',
  description: 'Former veterinarian!'
)

app6 = Application.create!(
  name: 'Mike Henlow',
  street: '6789 Six Ct',
  city: 'Reno',
  state: 'Nevada',
  zip_code: 90678,
  status: 'In Progress',
  description: 'Has lots of property'
)

app7 = Application.create!(
  name: 'Joe Chill',
  street: '7890 Seven Dr',
  city: 'Sal Lake City',
  state: 'Utah',
  zip_code: 90789,
  status: 'In Progress',
  description: 'Former dog trainer'
)

app8 = Application.create!(
  name: 'Jen Fitz',
  street: '8909 Eight Wy',
  city: 'Spring',
  state: 'Texas',
  zip_code: 90890,
  status: 'In Progress',
  description: 'Lots of love to give'
)

app9 = Application.create!(
  name: 'Boudica Helm',
  street: '9098 Nine Pl',
  city: 'Boulder',
  state: 'Colorado',
  zip_code: 90909,
  status: 'In Progress',
  description: 'Gives lots of treats'
)

app10 = Application.create!(
  name: 'Tiffany Bruser',
  street: '0987 Ten Pkwy',
  city: 'Helena',
  state: 'Montana',
  zip_code: 90098,
  status: 'In Progress',
  description: 'Enjoys going on walks'
)

# Shelters

shelter1 = Shelter.create!(
  name: "SD Humane Society",
  city: "San Diego",
  rank: 1,
  foster_program: "true"
)

shelter2 = Shelter.create!(
  name: "Boulder Humane Society",
  city: "Boulder",                        
  rank: 2,
  foster_program: "false"
)

# Pets

pet1 = shelter1.pets.create!(
  name: "Rick",
  breed: "Dalmation",
  adoptable: true,
  age: 1
)

pet2 = shelter1.pets.create!(
  name: "Morty",
  breed: "Pug",
  adoptable: true,
  age: 2
)

pet3 = shelter1.pets.create!(
  name: "Floopy",
  breed: "Husky",
  adoptable: true,
  age: 3
)

pet4 = shelter2.pets.create!(
  name: "Shmoopy",
  breed: "Spaniel",
  adoptable: true,
  age: 4
)

pet5 = shelter1.pets.create!(
  name: "Spike",
  breed: "Pitbull",
  adoptable: false,
  age: 5
)

pet6 = shelter1.pets.create!(
  name: "Happy",
  breed: "Chihuahua",
  adoptable: true,
  age: 6
)

pet7 = shelter2.pets.create!(
  name: "Skippy",
  breed: "Bulldog",
  adoptable: true,
  age: 7
)

pet8 = shelter2.pets.create!(
  name: "Spot",
  breed: "Malamute",
  adoptable: true,
  age: 8
)

pet9 = shelter2.pets.create!(
  name: "Loki",
  breed: "Golden Retriever",
  adoptable: true,
  age: 9
)

pet10 = shelter2.pets.create!(
  name: "Thor",
  breed: "Poodle",
  adoptable: false,
  age: 10
)

# Pet Applications

pet_app1 = PetApplication.create(pet: pet1, application: app1)
pet_app2 = PetApplication.create(pet: pet2, application: app1)
pet_app3 = PetApplication.create(pet: pet3, application: app2)
pet_app4 = PetApplication.create(pet: pet4, application: app2)